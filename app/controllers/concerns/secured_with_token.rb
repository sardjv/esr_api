module SecuredWithToken
  extend ActiveSupport::Concern

  def authenticate_request!
    verify_token && verify_system_active
  rescue AuthenticationError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  rescue NoActiveUsersError
    render json: { errors: ['No Active Users'] }, status: :forbidden
  rescue PermissionError
    render json: { errors: ['Permission Denied'] }, status: :forbidden
  end

  private

  def verify_token
    Token.verify(
      inbound_token: http_token,
      resource: requested_resource,
      action: requested_action
    )
  end

  def verify_system_active
    raise NoActiveUsersError unless User.where.not(confirmed_at: nil).exists?

    true
  end

  def http_token
    request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def requested_resource
    params['controller'].split('/').last.singularize.camelize
  end

  def requested_action
    params['action']
  end
end
