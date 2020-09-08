RSpec.shared_context 'Mock Auth' do
  before do
    class ApplicationController < ActionController::Base
      def signed_in?
        true
      end
    end

    class Ui::ApplicationController < Administrate::ApplicationController
      def signed_in?
        true
      end
    end
  end

  after do
    # Reset Auth after test.
    class ApplicationController < ActionController::Base
      def signed_in?
        super
      end
    end

    class Ui::ApplicationController < Administrate::ApplicationController
      def signed_in?
        super
      end
    end
  end
end
