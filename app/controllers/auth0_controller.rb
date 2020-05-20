class Auth0Controller < ApplicationController

  def callback
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to admin_root_path
  end

  def failure
    flash.notice = request.params['message']
    redirect_to root_path
  end

  def destroy
    reset_session
    flash.notice = 'You have been logged out.'
    redirect_to root_path
  end
end
