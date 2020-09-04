describe Ui::AbsenceRecordsController, type: :request do
  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_absence_records_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end

    describe 'GET show' do
      let(:absence_record) { create(:absence_record) }
      before { get ui_absence_record_path(absence_record.id) }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    include_context 'Mock Auth'

    describe 'GET index' do
      before { get ui_absence_records_path }
      it { expect(response).to be_successful }
    end

    describe 'GET show' do
      let(:absence_record) { create(:absence_record) }
      before { get ui_absence_record_path(absence_record.id) }
      it { expect(response).to be_successful }
    end
  end
end
