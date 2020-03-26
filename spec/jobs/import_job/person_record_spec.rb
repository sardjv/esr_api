describe ImportJob, type: :job do
  subject(:job) { ImportJob.perform_later(filename: file_fixture('person_record.dsv').to_path) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new PersonRecord' do
    perform_enqueued_jobs { job }

    expect(PersonRecord.count).to eq(1)
    expect(PersonRecord.first.PersonID).to eq('481801')
  end
end
