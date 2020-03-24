describe PagesController do
  describe 'GET home' do
    it 'renders the home template' do
      get :home
      expect(response).to be_successful
    end
  end
end
