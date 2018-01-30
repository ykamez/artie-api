class Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  # 　全体的にhttps://qiita.com/AQeNku/items/94485432184257799106を参考に実装中。

  def twitter
    auth = request.env['omniauth.auth']
    user = User.find_or_create_from_auth(auth)
    render json: user, serializer: ::V1::UserSerializer
  end

  # https://stackoverflow.com/questions/37225478/the-action-redirect-callbacks-could-not-be-found-for-usersomniauthcallbacksc

  def redirect_callbacks
    # https://github.com/lynndylanhurley/devise_token_auth/issues/586
    # use auth/twitter, not omniauth/twitter
    super
  end

  # Ths method overrides inherited controllers' method because some features is unused.
  def omniauth_success
    get_resource_from_auth_hash
    create_token_info
    set_token_on_resource
    create_auth_params

    # 使わないのでコメントアウト
    # if resource_class.devise_modules.include?(:confirmable)
    #  # don't send confirmation email!!!
    #  @resource.skip_confirmation!
    # end

    @resource.skip_confirmation!
    sign_in(:user, @resource, store: false, bypass: false)

    if @resource.save!
      # update_token_authをつけることでレスポンスヘッダーに認証情報を付与できる。
      update_auth_header
      yield @resource if block_given?

      @data = V1::UserSerializer.new(@resource)
      html = File.open('app/views/devise_token_auth/omniauth_external_window.html.erb').read
      template = ERB.new(html).result(binding)
      render html: template.html_safe
    else
      render json: { message: 'failed to login' }, status: 500
    end
  end

  protected

    def get_resource_from_auth_hash
      @resource = resource_class.where({
        uid:      auth_hash['uid'],
        provider: auth_hash['provider']
      }).first_or_initialize

      if @resource.new_record?
        @oauth_registration = true
        # これが呼ばれるとエラーになるのでコメントアウト by qiita
        # set_random_password
      end

      # sync user info with provider, update/generate auth token
      assign_provider_attrs(@resource, auth_hash.with_indifferent_access)

      # assign any additional (whitelisted) attributes
      extra_params = whitelisted_params
      @resource.assign_attributes(extra_params) if extra_params

      @resource
    end

    def assign_provider_attrs(user, auth)
      provider = auth[:provider]
      uid = auth[:uid]
      nickname = auth[:info][:nickname]
      image_url = auth[:info][:image]
      user.assign_attributes({
        uid:      uid,
        fullname: nickname,
        image_data: image_url,
        provider: provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      })
    end
end
