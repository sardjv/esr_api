describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('mixed_import.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  context 'with records created' do
    before { perform_enqueued_jobs { job } }

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

        # Expect values in the database to match input from mixed_record.dsv.
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
