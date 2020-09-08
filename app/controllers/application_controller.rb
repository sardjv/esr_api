class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_signed_in!, if: :check_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    ui_absence_records_path
  end

  private

  def check_signed_in!
    return if signed_in?

    redirect_to pages_home_path
  end

  def check_signed_in?
    !(devise_controller? || ['PagesController'].include?(controller_name))
  end
end
