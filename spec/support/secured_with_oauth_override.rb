# Mock users as authenticated for tests.
module SecuredWithOauth
  def admin_authenticated?
    true
  end
end
