describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('mixed_import.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates new records' do
    perform_enqueued_jobs { job }

    expect(AbsenceRecord.count).to eq(1)
    expect(PersonRecord.count).to eq(1)

    absence_record = AbsenceRecord.first
    person_record = PersonRecord.first

    # Expect values in the database to match input from mixed_record.dsv.
    ImportExpectations.absence_record.each do |key, value|
      expect(absence_record.send(key)).to eq(value)
    end
    ImportExpectations.person_record.each do |key, value|
      expect(person_record.send(key)).to eq(value)
    end
  end
end
