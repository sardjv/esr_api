module SecuredWithToken
  extend ActiveSupport::Concern

  def authenticate_request!
    auth_token
  rescue VerificationError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def http_token
    request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    Token.verify(http_token)
  end
end
