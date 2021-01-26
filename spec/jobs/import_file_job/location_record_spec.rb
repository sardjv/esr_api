describe ImportFileJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:add_filename) { file_fixture('good_imports/add_location_record_20201015_00001157.DAT').to_path }
  let(:update_filename) { file_fixture('good_imports/update_location_record_20201015_00001157.DAT').to_path }
  let(:delete_filename) { file_fixture('good_imports/delete_location_record_20201015_00001157.DAT').to_path }
  let(:add_job) { ImportFileJob.perform_later(filename: add_filename) }
  let(:update_job) { ImportFileJob.perform_later(filename: update_filename) }
  let(:delete_job) { ImportFileJob.perform_later(filename: delete_filename) }

  it 'queues the jobs' do
    expect { add_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    expect { update_job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'creates a new LocationRecord' do
    perform_enqueued_jobs { add_job }

    expect(LocationRecord.count).to eq(1)
    pr = LocationRecord.first

    # Expect values in the database to match input from add_location_record_20201015_00001157.DAT.
    Expectations::LocationRecord.added.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end

  context 'with an existing LocationRecord' do
    before do
      perform_enqueued_jobs { add_job }
      LocationRecord.first.update(
        'created_at' => Time.current - 1.week,
        'updated_at' => Time.current - 1.week
      )
    end

    it 'updates it' do
      perform_enqueued_jobs { update_job }

      expect(LocationRecord.count).to eq(1)
      pr = LocationRecord.first

      expect(pr.created_at).to be_within(2.seconds).of(Time.current - 1.week)
      expect(pr.updated_at).to be_within(2.seconds).of(Time.current)

      # Expect values in the database to match input from update_location_record_20201015_00001157.DAT.
      Expectations::LocationRecord.updated.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end

    it 'deletes it' do
      perform_enqueued_jobs { delete_job }

      expect(LocationRecord.count).to eq(0)
    end
  end
end
