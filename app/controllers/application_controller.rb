class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :update_sanitized_params, if: :devise_controller?
  helper_method :current_company

  protected 

  def current_company
    return current_user.try(:company)
  end

  def configure_permitted_parameters 
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name,:password, :password_confirmation, :current_password)}
  end 
end
