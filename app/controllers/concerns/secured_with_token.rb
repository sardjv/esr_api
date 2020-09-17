module SecuredWithToken
  extend ActiveSupport::Concern

  def authenticate_request!
    verify_token && verify_system_active
  rescue AuthenticationError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  rescue NoActiveUsersError
    render json: { errors: ['No Active Users'] }, status: :forbidden
  end

  def http_token
    request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def verify_token
    Token.verify(http_token)
  end

  def verify_system_active
    raise NoActiveUsersError unless User.where.not(confirmed_at: nil).exists?

    true
  end
end
