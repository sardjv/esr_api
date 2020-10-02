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
    let(:confirmed_user) { create(:confirmed_user) }

    before { sign_in confirmed_user }

    describe 'PUT update' do
      before { put ui_user_path(user), params: { user: { first_name: updated_name } } }
      it { expect(response).to redirect_to(ui_users_path) }
      it { expect(user.reload.first_name).to eq(updated_name) }

      describe 'activating user' do
        before { put ui_user_path(user), params: { user: { activated: '1' } } }
        it { expect(user.reload.confirmed_at).not_to eq(nil) }

        describe 'deactivating user' do
          before { put ui_user_path(user), params: { user: { activated: '0' } } }
          it { expect(user.reload.confirmed_at).to eq(nil) }
        end
      end

      describe 'papertrail' do
        it 'creates a new version with a whodunnit' do
          expect(user.versions.last.whodunnit_type).to eq('User')
          expect(user.versions.last.whodunnit).to eq(confirmed_user.id.to_s)
        end
      end
    end
  end

  context 'when not authenticated' do
    let!(:user) { create(:user) }

    describe 'DELETE destroy' do
      before { delete ui_user_path(user) }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not delete the token' do
        expect { delete ui_user_path(user) }.not_to change { User.count }
      end
    end
  end

  context 'when authenticated' do
    let!(:user) { create(:user) }

    before { sign_in create(:confirmed_user) }

    describe 'DELETE destroy' do
      it 'deletes the user' do
        expect { delete ui_user_path(user) }.to change { User.count }.by(-1)
      end
    end
  end
end
