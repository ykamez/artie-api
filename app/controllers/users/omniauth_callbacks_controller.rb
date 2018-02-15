class Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  # 参考: https://qiita.com/AQeNku/items/94485432184257799106
  def redirect_callbacks
    # 参考: https://github.com/lynndylanhurley/devise_token_auth/issues/586
    super
  end

  def omniauth_success
    get_resource_from_auth_hash
    create_token_info
    set_token_on_resource
    create_auth_params
    @resource.skip_confirmation!
    sign_in(:user, @resource, store: false, bypass: false)
    if @resource.save!
      update_auth_header
      yield @resource if block_given?
      @data = {
        id: @resource.id,
        full_name: @resource.fullname,
        total_likes_count: @resource.likes_count,
        followings_count: @resource.following_count,
        followers_count: @resource.followers_count,
        evaluation_point: @resource.evaluation_point,
        access_token: headers['access-token'],
        client: headers['client'],
        uid: headers['uid']
      }
      @data[:image_url] = if @resource.image_data.file.nil?
                            @resource.image_data
                          else
                            @resource.image_data.url
                          end
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
      end

      assign_provider_attrs(@resource, auth_hash.with_indifferent_access)

      extra_params = whitelisted_params
      @resource.assign_attributes(extra_params) if extra_params

      @resource
    end

    def assign_provider_attrs(user, auth)
      provider = auth[:provider]
      uid = auth[:uid]
      name = auth[:info][:name]
      image_url = auth[:info][:image].to_s.sub('normal', 'bigger')
      user.remote_image_data_url = image_url
      user.assign_attributes({
        uid:      uid,
        fullname: name,
        provider: provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      })
    end

    def use_before_action?
      false
    end
end
