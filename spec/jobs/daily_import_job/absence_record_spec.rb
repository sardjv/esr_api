describe DailyImportJob, type: :job do
  let(:filename) { file_fixture('add_absence_record.dsv').to_path }
  subject(:job) { DailyImportJob.perform_later(filename: filename) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new AbsenceRecord' do
    perform_enqueued_jobs { job }

    expect(AbsenceRecord.count).to eq(1)
    pr = AbsenceRecord.first

    # Expect values in the database to match input from add_absence_record.dsv.
    ImportExpectations.absence_record.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end
end
