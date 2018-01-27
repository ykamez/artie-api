class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Concerns::Paging

  # 継承先を変更したタイミングで消したやつ
  # protect_from_forgery with: :exception
  # FIXME: これをかくと、You need to sign in or sign up before continuing.となるので、一旦コメントアウト。¡
  # before_action :authenticate_user!
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username image])
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate!
    redirect_to root_path unless user_signed_in?
  end
end
