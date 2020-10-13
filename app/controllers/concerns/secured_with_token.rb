module SecuredWithToken
  extend ActiveSupport::Concern

  def authenticate_request!
    verify_token && verify_system_active && log_request
  rescue AuthenticationError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  rescue NoActiveUsersError
    render json: { errors: ['No Active Users'] }, status: :forbidden
  rescue PermissionError
    render json: { errors: ['Permission Denied'] }, status: :forbidden
  end

  private

  def verify_token
    @credentials = Token.verify(
      inbound_token: http_token,
      resource: requested_resource,
      action: requested_action
    )
  end

  def verify_system_active
    raise NoActiveUsersError unless User.where.not(confirmed_at: nil).exists?

    true
  end

  def log_request
    return unless params['id']

    Log.create(
      trackable_type: requested_resource,
      trackable_id: params['id'],
      key: "#{requested_resource.underscore}.#{requested_action}",
      owner_type: 'Token',
      owner_id: @credentials[:token].id
    )
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
