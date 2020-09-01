describe Admin::AbsenceRecordsController, type: :request do
  context 'when not authenticated' do
    describe 'GET index' do
      before { get admin_absence_records_path }
      it { expect(response).to redirect_to('/') }
    end

    describe 'GET show' do
      let(:absence_record) { create(:absence_record) }
      before { get admin_absence_record_path(absence_record.id) }
      it { expect(response).to redirect_to('/') }
    end
  end

  context 'when authenticated' do
    include_context 'Mock OAuth'

    describe 'GET index' do
      before { get admin_absence_records_path }
      it { expect(response).to be_successful }
    end

    describe 'GET show' do
      let(:absence_record) { create(:absence_record) }
      before { get admin_absence_record_path(absence_record.id) }
      it { expect(response).to be_successful }
    end
  end
end
