class Auth0Controller < ApplicationController
  def callback
    session[:user_id] = '123'
    session[:provider] = 'auth0'
    redirect_to rswag_ui_path
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
