module SecuredWithOauth
  extend ActiveSupport::Concern

  def authenticate_user!
    return if user_authenticated?

    redirect_to '/'
  end

  def user_authenticated?
    session && session[:userinfo].present?
  end
end
