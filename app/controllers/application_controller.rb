class ApplicationController < ActionController::Base

    # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
  # devise_parameter_sanitizer.for(:sign_up) << :username
  devise_parameter_sanitizer.for(:sign_up) << :email
  devise_parameter_sanitizer.for(:sign_up) << :password

  devise_parameter_sanitizer.for(:account_update) << :email
  devise_parameter_sanitizer.for(:account_update) << :password
end

  protect_from_forgery with: :exception

end
