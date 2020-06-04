module SecuredWithOauth
  extend ActiveSupport::Concern

  included do
    before_action :redirect_unless_logged_in
  end

  def redirect_unless_logged_in
    redirect_to '/' unless admin_authenticated?
  end

  def admin_authenticated?
    session[:userinfo].present?
  end
end
