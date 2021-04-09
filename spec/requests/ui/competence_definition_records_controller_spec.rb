describe Ui::CompetenceDefinitionRecordsController, type: :request do
  let!(:competence_definition_record) { create(:competence_definition_record) }

  context 'when not authenticated' do
    describe 'GET index' do
      before { get ui_competence_definition_records_path }
      it { expect(response).to redirect_to(pages_home_path) }
    end

    describe 'GET show' do
      before { get ui_competence_definition_record_path(competence_definition_record.id) }
      it { expect(response).to redirect_to(pages_home_path) }
    end

    describe 'GET CSV export' do
      context 'with a null date' do
        before { get export_ui_competence_definition_records_path, params: { format: :csv } }
        it { expect(response).not_to be_successful }
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET index' do
      before { get ui_competence_definition_records_path }
      it { expect(response).to be_successful }
    end

    describe 'GET show' do
      before { get ui_competence_definition_record_path(competence_definition_record.id) }
      it { expect(response).to be_successful }
    end

    describe 'GET CSV export' do
      before { get export_ui_competence_definition_records_path, params: { format: :csv } }
      it { expect(response).to be_successful }

      context 'with nil values' do
        before do
          competence_definition_record.update(
            competence_definition_record
              .attributes.except('id', 'created_at', 'updated_at')
              .transform_values { nil }
          )
        end

        it { expect(response).to be_successful }
      end
    end
  end
end
