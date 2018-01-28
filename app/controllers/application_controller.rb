class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Concerns::Paging

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
      raise BadRequest
    end
  end
end
