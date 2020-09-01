RSpec.shared_context 'Mock OAuth' do
  before do
    class Admin::ApplicationController < Administrate::ApplicationController
      def user_authenticated?
        true
      end
    end
  end

  after do
    # Reset Auth after test.
    class Admin::ApplicationController < Administrate::ApplicationController
      def user_authenticated?
        session && session[:userinfo].present?
      end
    end
  end
end
