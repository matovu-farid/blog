class ApplicationController < ActionController::Base
  # rescue_from CanCan::AccessDenied do | exception |
  #   redirect_to root_url, alert: exception.message
  # end
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :password_confirmation,:role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :password_confirmation,:role)
    end
  end
end
