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
    PublishEvent.call(:before_user_sign_out, current_user, request.env['HTTP_HOST'], request.env['rack.session']) if current_user
    flash.notice = 'You have been logged out.'
    redirect_to root_path
  end
end
