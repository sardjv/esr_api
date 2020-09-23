describe Ui::TokensController, type: :request do
  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_tokens_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET index' do
      before { get ui_tokens_path }
      it { expect(response).to be_successful }
    end
  end

  context 'when not authenticated' do
    describe 'GET new' do
      describe 'format.html' do
        before { get new_ui_token_path }
        it { expect(response).to redirect_to(pages_home_path) }
      end

      describe 'format.js' do
        let(:params) { { resource: 'AbsenceRecord' } }

        before { get new_ui_token_path, params: params, xhr: true }
        it { expect(response).not_to be_successful }
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET new' do
      describe 'format.html' do
        before { get new_ui_token_path }
        it { expect(response).to be_successful }
      end

      describe 'format.js' do
        let(:params) { { resource: resource } }

        before { get new_ui_token_path, params: params, xhr: true }

        context 'with resource set to AbsenceRecord' do
          let(:resource) { 'AbsenceRecord' }

          it { expect(response).to be_successful }
        end

        context 'with resource set to AbsenceRecord' do
          let(:resource) { 'AssignmentRecord' }

          it { expect(response).to be_successful }
        end
      end
    end
  end

  context 'when not authenticated' do
    describe 'POST create' do
      before { post ui_tokens_path, params: { token: { name: 'test' } } }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not create a new token' do
        expect { post ui_tokens_path, params: { token: { name: 'test' } } }.not_to change { Token.count }
      end
    end
  end

  context 'when authenticated' do
    let(:name) { 'Test Token' }
    let(:permission_resource) { 'AbsenceRecord' }
    let(:permission_action) { 'index' }
    let(:permission_columns) {
      [
        '',
        'Absence Attendance ID',
        'Absence Type'
      ]
    }

    before { sign_in create(:confirmed_user) }

    describe 'POST create' do
      it 'creates a new token' do
        expect {
          post ui_tokens_path,
          params: {
            token: {
              name: name,
              permissions_attributes: [
                {
                  resource: permission_resource,
                  action: permission_action,
                  columns: permission_columns
                }
              ]
            }
          }
        }.to change { Token.count }.by(1)
        expect(Token.last.name).to eq(name)
        expect(Token.last.permissions.first.resource).to eq(permission_resource)
        expect(Token.last.permissions.first.action).to eq(permission_action)
        expect(Token.last.permissions.first.columns).to eq(permission_columns.reject(&:empty?).join(','))
      end
    end
  end

  context 'when not authenticated' do
    let!(:token) { create(:token) }

    describe 'GET show' do
      before { get ui_token_path(token) }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let!(:token) { create(:token) }

    describe 'GET show' do
      before { get ui_token_path(token) }
      it { expect(response).to be_successful }

      it 'includes the decrypted token' do
        expect(response.body).to include(token.token)
      end

      context 'when accessing again' do
        before { get ui_token_path(token) }

        it 'the decrypted token is not shown to the user' do
          expect(response.body).not_to include(token.token)
        end
      end
    end
  end

  context 'when not authenticated' do
    let!(:token) { create(:token) }

    describe 'DELETE destroy' do
      before { delete ui_token_path(token) }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not delete the token' do
        expect { delete ui_token_path(token) }.not_to change { Token.count }
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let!(:token) { create(:token) }

    describe 'DELETE destroy' do
      it 'deletes the token' do
        expect { delete ui_token_path(token) }.to change { Token.count }.by(-1)
      end
    end
  end
end
