# Mock users as authenticated for tests.
module Secured
  def admin_authenticated?
    true
  end
end
