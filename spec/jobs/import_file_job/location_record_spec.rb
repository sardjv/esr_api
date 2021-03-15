describe ImportFileJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:ftp_credential) { create(:ftp_credential, path: path) }
  let(:import_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }

  describe 'add' do
    let(:path) { 'good_imports/location_record/add' }

    it 'queues the job' do
      expect { import_job }
        .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    it 'creates a new LocationRecord' do
      perform_enqueued_jobs { import_job }

      expect(LocationRecord.count).to eq(1)
      pr = LocationRecord.first

      # Expect values in the database to match input from add_location_record_20201015_00001157.DAT.
      Expectations::LocationRecord.added.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end
  end

  describe 'update' do
    let(:path) { 'good_imports/location_record/update' }

    it 'queues the job' do
      expect { import_job }
        .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    end

    context 'with an existing LocationRecord' do
      before do
        build(:location_record) do |r|
          r.assign_attributes(
            Expectations::LocationRecord.added.merge(
              'created_at' => Time.current - 1.week,
              'updated_at' => Time.current - 1.week
            )
          )
          r.save
        end
      end

      it 'updates it' do
        perform_enqueued_jobs { import_job }

        expect(LocationRecord.count).to eq(1)
        pr = LocationRecord.first

        expect(pr.created_at).to be_within(2.seconds).of(Time.current - 1.week)
        expect(pr.updated_at).to be_within(2.seconds).of(Time.current)

        # Expect values in the database to match input from update_location_record_20201015_00001157.DAT.
        Expectations::LocationRecord.updated.each do |key, value|
          expect(pr.send(key)).to eq(value)
        end
      end

      it 'versions it' do
        perform_enqueued_jobs { import_job }

        expect(LocationRecord.first.versions.last.whodunnit_type).to eq('Import')
        expect(LocationRecord.first.versions.last.whodunnit).to include('update')
      end
    end
  end

  describe 'delete' do
    let(:path) { 'good_imports/location_record/delete' }

    it 'deletes it' do
      perform_enqueued_jobs { import_job }

      expect(LocationRecord.count).to eq(0)
    end
  end
end
