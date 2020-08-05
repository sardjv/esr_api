# Mock users as authenticated for tests.
module SecuredWithOauth
  def user_authenticated?
    true
  end
end
