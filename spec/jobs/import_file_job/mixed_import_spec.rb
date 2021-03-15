describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:ftp_credential) { create(:ftp_credential, path: 'good_imports/mixed_import') }
  let(:import_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }

  context 'with records created' do
    before { perform_enqueued_jobs { import_job } }

    it 'sets attributes correctly' do
      [
        AbsenceRecord,
        AssignmentRecord,
        CompetencyRecord,
        CostingRecord,
        DisabilityRecord,
        ElementRecord,
        LocationRecord,
        OrganisationRecord,
        PersonEitRecord,
        PersonRecord,
        PositionEitRecord,
        PositionRecord,
        QualificationRecord,
        SitRecord,
        TrainingAbsenceRecord
      ].each do |klass|
        expect(klass.count).to eq(1)

        # Expect values in the database to match input from mixed_record_20201015_00001157.DAT.
        "Expectations::#{klass}".constantize.updated.each do |key, value|
          expect(klass.first.send(key)).to eq(value)
        end

        # Expect timestamps.
        klass.all.each do |record|
          expect(record.created_at).not_to eq(nil)
          expect(record.updated_at).not_to eq(nil)
        end
      end
    end
  end
end
