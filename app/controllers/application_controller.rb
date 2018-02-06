class ApplicationController < ActionController::API
  force_ssl if: :ssl_configured?
  include ::Concerns::ErrorHandling
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Concerns::Paging
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_client!

  # 継承先を変更したタイミングで消したやつ
  # protect_from_forgery with: :exception

  def current_user
    # FIXME: this is tmp code. Should user access_token, not uid.
    uid = request.headers['Uid']
    @current_user = User.find_by(uid: uid)
  end

  # https://qiita.com/travelist/items/ec0b08a9a19cbe9ec78b
  def authenticate_user!
    uid = request.headers['Uid']
    token = request.headers['Access-Token']
    client = request.headers['Client']
    @user = User.find_by(uid: uid)
    # 認証に失敗したらエラー
    unless @user && @user.valid_token?(token, client)
      raise ActionController::BadRequest, e.message
    end
  end

  def authenticate_client!
    if x_application_token != Settings.client.application_token
      raise ActionController::BadRequest, e.message
    end
  end

  private

  # https://github.com/lynndylanhurley/devise_token_auth/issues/440
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :image_data, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :image_data, :email, :password])
  end

  def ssl_configured?
    Rails.env.production?
  end

  def x_application_token
    request.headers['X-Application-Token'] || request.headers['x-application-token']
  end
end
