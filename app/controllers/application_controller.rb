class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[photo first_name last_name preferences])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :first_name, :last_name, preferences:[]])
  end
end
