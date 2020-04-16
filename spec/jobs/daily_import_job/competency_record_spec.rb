describe DailyImportJob, type: :job do
  let(:add_filename) { file_fixture('add_competency_record.dsv').to_path }
  let(:update_filename) { file_fixture('update_competency_record.dsv').to_path }
  let(:delete_filename) { file_fixture('delete_competency_record.dsv').to_path }
  let(:add_job) { DailyImportJob.perform_later(filename: add_filename) }
  let(:update_job) { DailyImportJob.perform_later(filename: update_filename) }
  let(:delete_job) { DailyImportJob.perform_later(filename: delete_filename) }

  it 'queues the jobs' do
    expect { add_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    expect { update_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new CompetencyRecord' do
    perform_enqueued_jobs { add_job }

    expect(CompetencyRecord.count).to eq(1)
    pr = CompetencyRecord.first

    # Expect values in the database to match input from add_competency_record.dsv.
    Expectations::CompetencyRecord.added.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end

  context 'with an existing CompetencyRecord' do
    before do
      perform_enqueued_jobs { add_job }
      CompetencyRecord.first.update(
        'created_at' => Time.current - 1.week,
        'updated_at' => Time.current - 1.week
      )
    end

    it 'updates it' do
      perform_enqueued_jobs { update_job }

      expect(CompetencyRecord.count).to eq(1)
      pr = CompetencyRecord.first

      expect(pr.created_at).to be_within(2.seconds).of(Time.current - 1.week)
      expect(pr.updated_at).to be_within(2.seconds).of(Time.current)

      # Expect values in the database to match input from update_competency_record.dsv.
      Expectations::CompetencyRecord.updated.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end

    it 'deletes it' do
      perform_enqueued_jobs { delete_job }

      expect(CompetencyRecord.count).to eq(0)
    end
  end
end
