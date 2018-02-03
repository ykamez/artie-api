class AdminController < ActionController::Base
  force_ssl if: :ssl_configured?
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'],
                               password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.production?


  private

  def ssl_configured?
    Rails.env.production?
  end

  def authenticate!
    redirect_to '/' unless current_user.admin?
  end
end
