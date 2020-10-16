describe Ui::AbsenceRecordsController, type: :request do
  let!(:absence_record) { create(:absence_record) }

  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_absence_records_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end

    describe 'GET show' do
      before { get ui_absence_record_path(absence_record.id) }
      it { expect(response).to redirect_to(pages_home_path) }
    end

    describe 'GET CSV export' do
      context 'with a null date' do
        before { get export_ui_absence_records_path, params: { format: :csv } }
        it { expect(response).not_to be_successful }
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET index' do
      before { get ui_absence_records_path }
      it { expect(response).to be_successful }
    end

    describe 'GET show' do
      before { get ui_absence_record_path(absence_record.id) }
      it { expect(response).to be_successful }
    end

    describe 'GET CSV export' do
      context 'with a null date' do
        before { get export_ui_absence_records_path, params: { format: :csv } }
        it { expect(response).to be_successful }
      end
    end
  end
end
