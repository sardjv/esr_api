describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('mixed_import.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  context 'with records created' do
    before { perform_enqueued_jobs { job } }

    it 'sets attributes correctly' do
      expect(AbsenceRecord.count).to eq(1)
      expect(PersonRecord.count).to eq(1)
      expect(PositionRecord.count).to eq(1)

      absence_record = AbsenceRecord.first
      person_record = PersonRecord.first
      position_record = PositionRecord.first

      # Expect values in the database to match input from mixed_record.dsv.
      ImportExpectations.absence_record.each do |key, value|
        expect(absence_record.send(key)).to eq(value)
      end
      ImportExpectations.person_record_updated.each do |key, value|
        expect(person_record.send(key)).to eq(value)
      end
      ImportExpectations.position_record.each do |key, value|
        expect(position_record.send(key)).to eq(value)
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
