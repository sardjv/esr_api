RSpec.shared_context 'Mock Token' do
  before do
    module SecuredWithToken
      def authenticate_request!
        true
      end
    end
  end

  after do
    # Reset Auth after test.
    module SecuredWithToken
      def authenticate_request!
        auth_token
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end
    end
  end
end
