class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth = request.env['omniauth.auth']
    user = User.find_or_create_from_auth(auth)
    session[:user_id] = user.id
    render json: user, serializer: ::V1::UserSerializer
  end
end