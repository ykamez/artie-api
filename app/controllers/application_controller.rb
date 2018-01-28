class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Concerns::Paging

  # 継承先を変更したタイミングで消したやつ
  # protect_from_forgery with: :exception
  # FIXME: これをかくと、You need to sign in or sign up before continuing.となるので、一旦コメントアウト。¡
  # before_action :authenticate_user!

  private
  # 参考: https://qiita.com/travelist/items/ec0b08a9a19cbe9ec78b
    def current_user
      uid = request.headers['Uid']
      token = request.headers['Access-Token']
      client = request.headers['Client']
      User.find_by_uid(uid)
    end

    def logged_in?
      !!session[:user_id]
    end

    def authenticate
      return if logged_in?
      redirect_to root_path
    end
end
