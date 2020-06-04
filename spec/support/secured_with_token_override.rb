# Mock api calls as authenticated for tests.
module SecuredWithToken
  def authenticate_request!
    true
  end
end
