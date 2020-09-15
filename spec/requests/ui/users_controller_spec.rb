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

  context 'when not authenticated' do
    let(:user) { create(:user) }
    let(:updated_name) { 'new name' }

    describe 'PUT update' do
      before { put ui_user_path(user), params: { user: { first_name: updated_name } } }
      it { expect(response).to redirect_to(pages_home_path) }
      it { expect(user.reload.first_name).not_to eq(updated_name) }

    end
  end

  context 'when authenticated' do
    let(:user) { create(:user) }
    let(:updated_name) { 'new name' }

    before { sign_in create(:confirmed_user) }

    describe 'PUT update' do
      before { put ui_user_path(user), params: { user: { first_name: updated_name } } }
      it { expect(response).to be_successful }
      it { expect(user.reload.first_name).to eq(updated_name) }

      describe 'activating user' do
        before { put ui_user_path(user), params: { user: { activated: '1' } } }
        it { expect(user.reload.confirmed_at).to be_within(1.second).of(Time.current) }

        describe 'deactivating user' do
          before { put ui_user_path(user), params: { user: { activated: '0' } } }
          it { expect(user.reload.confirmed_at).to eq(nil) }
        end

      end
    end
  end
end
