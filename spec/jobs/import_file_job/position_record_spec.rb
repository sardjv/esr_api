describe ImportFileJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:add_filename) do
    file_fixture('good_imports/add_position_record_20201015_00001157.DAT').to_path
  end
  subject(:add_job) { ImportFileJob.perform_later(filename: add_filename) }
  let(:update_filename) do
    file_fixture('good_imports/update_position_record_20201015_00001157.DAT').to_path
  end
  subject(:update_job) { ImportFileJob.perform_later(filename: update_filename) }

  it 'queues the job' do
    expect { add_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    expect { update_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new PositionRecord' do
    perform_enqueued_jobs { add_job }

    expect(PositionRecord.count).to eq(1)
    pr = PositionRecord.first

    # Expect values in the database to match input from add_position_record_20201015_00001157.DAT.
    Expectations::PositionRecord.added.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end

  context 'with an existing PositionRecord' do
    before do
      perform_enqueued_jobs { add_job }
      PositionRecord.first.update(
        'created_at' => Time.current - 1.week,
        'updated_at' => Time.current - 1.week
      )
    end

    it 'updates it' do
      perform_enqueued_jobs { update_job }

      expect(PositionRecord.count).to eq(1)
      pr = PositionRecord.first

      expect(pr.created_at).to be_within(2.seconds).of(Time.current - 1.week)
      expect(pr.updated_at).to be_within(2.seconds).of(Time.current)

      # Expect values in the database to match input from update_position_record_20201015_00001157.DAT.
      Expectations::PositionRecord.updated.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end
  end
end
