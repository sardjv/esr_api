describe Ui::UsersController, type: :request do
  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_users_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET index' do
      before { get ui_users_path }
      it { expect(response).to be_successful }
    end
  end

  context 'when not authenticated' do
    let(:user) { create(:user) }

    describe 'GET edit' do
      before { get edit_ui_user_path(user) }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    let(:user) { create(:user) }

    before { sign_in create(:confirmed_user) }

    describe 'GET edit' do
      before { get edit_ui_user_path(user) }
      it { expect(response).to be_successful }
    end
  end
end
