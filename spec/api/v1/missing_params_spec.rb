describe Api::V1::AbsenceRecordsController, type: :request do
  context 'with an absence_record' do
    let!(:absence_record) { create(:absence_record) }

    context 'with a valid token' do
      let!(:token) { create(:token, created_by: create(:confirmed_user)) }

      context 'with empty params and no records' do
        describe 'GET index' do
          before do
            headers = { Authorization: token.token }
            get api_v1_absence_records_path, params: {}, headers: headers
          end

          it { expect(response).to be_successful }
        end
      end
    end
  end
end
