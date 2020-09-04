RSpec.shared_context 'Mock Auth' do
  before do
    class Ui::ApplicationController < Administrate::ApplicationController
      def signed_in?
        true
      end
    end
  end

  after do
    # Reset Auth after test.
    class Ui::ApplicationController < Administrate::ApplicationController
      def signed_in?
        super
      end
    end
  end
end
