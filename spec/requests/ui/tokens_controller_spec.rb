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
      before { get new_ui_token_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET new' do
      before { get new_ui_token_path }
      it { expect(response).to be_successful }
    end
  end

  context 'when not authenticated' do
    describe 'POST create' do
      before { post ui_tokens_path, params: { token: { name: 'test' } } }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let(:token) { { token: { name: 'test' } } }

    describe 'POST create' do
      it 'creates a new token' do
        expect { post ui_tokens_path, params: { token: { name: 'test' } } }.to change { Token.count }.by(1)
      end
    end
  end
end
