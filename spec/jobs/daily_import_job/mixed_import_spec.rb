describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('mixed_import.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  context 'with records created' do
    before { perform_enqueued_jobs { job } }

    it 'sets attributes correctly' do
      expect(AbsenceRecord.count).to eq(1)
      expect(PersonRecord.count).to eq(1)
      expect(PositionRecord.count).to eq(1)
      expect(LocationRecord.count).to eq(1)

      # Expect values in the database to match input from mixed_record.dsv.
      Expectations::AbsenceRecord.updated.each do |key, value|
        expect(AbsenceRecord.first.send(key)).to eq(value)
      end
      Expectations::PersonRecord.updated.each do |key, value|
        expect(PersonRecord.first.send(key)).to eq(value)
      end
      Expectations::PositionRecord.updated.each do |key, value|
        expect(PositionRecord.first.send(key)).to eq(value)
      end
      Expectations::LocationRecord.updated.each do |key, value|
        expect(LocationRecord.first.send(key)).to eq(value)
      end

      # Adds timestamps.
      [AbsenceRecord, PersonRecord, PositionRecord].each do |klass|
        klass.all.each do |record|
          expect(record.created_at).not_to eq(nil)
          expect(record.updated_at).not_to eq(nil)
        end
      end
    end
  end
end
