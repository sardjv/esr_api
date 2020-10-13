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
    before { sign_in create(:confirmed_user) }

    describe 'GET index' do
      before { get ui_absence_records_path }
      it { expect(response).to be_successful }

      it 'creates a log entry' do
        expect(Log.last.key).to eq('absence_record.index')
      end
    end

    describe 'GET show' do
      let(:absence_record) { create(:absence_record) }
      before { get ui_absence_record_path(absence_record.id) }
      it { expect(response).to be_successful }

      it 'creates a log entry' do
        expect(Log.last.key).to eq('absence_record.show')
      end
    end
  end
end
