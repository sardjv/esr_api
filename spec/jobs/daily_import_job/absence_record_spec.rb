describe DailyImportJob, type: :job do
  let(:add_filename) { file_fixture('add_absence_record.dsv').to_path }
  subject(:add_job) { DailyImportJob.perform_later(filename: add_filename) }
  let(:update_filename) { file_fixture('update_absence_record.dsv').to_path }
  subject(:update_job) { DailyImportJob.perform_later(filename: update_filename) }
  let(:delete_filename) { file_fixture('delete_absence_record.dsv').to_path }
  subject(:delete_job) { DailyImportJob.perform_later(filename: delete_filename) }

  it 'queues the job' do
    expect { add_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    expect { update_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new AbsenceRecord' do
    perform_enqueued_jobs { add_job }

    expect(AbsenceRecord.count).to eq(1)
    pr = AbsenceRecord.first

    # Expect values in the database to match input from add_absence_record.dsv.
    Expectations::AbsenceRecord.added.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end

  context 'with an existing AbsenceRecord' do
    before do
      perform_enqueued_jobs { add_job }
      AbsenceRecord.first.update(
        'created_at' => Time.current - 1.week,
        'updated_at' => Time.current - 1.week
      )
    end

    it 'updates it' do
      perform_enqueued_jobs { update_job }

      expect(AbsenceRecord.count).to eq(1)
      pr = AbsenceRecord.first

      expect(pr.created_at).to be_within(2.seconds).of(Time.current - 1.week)
      expect(pr.updated_at).to be_within(2.seconds).of(Time.current)

      # Expect values in the database to match input from update_absence_record.dsv.
      Expectations::AbsenceRecord.updated.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end

    it 'deletes it' do
      perform_enqueued_jobs { delete_job }

      expect(AbsenceRecord.count).to eq(0)
    end
  end
end
