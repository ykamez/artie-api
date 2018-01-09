class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # 継承先を変更したタイミングで消したやつ
  # protect_from_forgery with: :exception
  # FIXME: これをかくと、You need to sign in or sign up before continuing.となるので、一旦コメントアウト。
  # before_action :authenticate_user!

  def current_user
    @current_user = User.find(2)
  end
end
