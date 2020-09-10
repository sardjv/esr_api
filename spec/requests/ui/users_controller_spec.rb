describe Ui::UsersController, type: :request do
  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_users_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    include_context 'Mock Auth'

    describe 'GET index' do
      before { get ui_users_path }
      it { expect(response).to be_successful }
    end
  end
end
