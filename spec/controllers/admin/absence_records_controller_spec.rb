describe Admin::AbsenceRecordsController do
  describe 'GET index' do
    before { get :index }
    it { expect(response).to be_successful }
  end

  describe 'GET show' do
    let(:absence_record) { create(:absence_record) }
    before { get :show, params: { id: absence_record.id } }
    it { expect(response).to be_successful }
  end
end
