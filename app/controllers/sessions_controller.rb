class SessionsController < ApplicationController
  def create
    auth = session['dta.omniauth.auth'].with_indifferent_access
    # FIXME: this may be incorrect.
    user = User.find_or_create_from_auth(auth)
    session[:user_id] = user.id
    render json: user, serializer: ::V1::UserSerializer
  end

  def destroy
    reset_session
    render json: {}
  end
end
