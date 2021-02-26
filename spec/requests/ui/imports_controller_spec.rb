describe Ui::ImportsController, type: :request do
  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_imports_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET index' do
      before { get ui_imports_path }
      it { expect(response).to be_successful }
    end
  end
end
