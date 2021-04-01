describe RequestSnapshotJob, type: :job do
  describe 'perform' do
    context 'with no admins' do
      it 'does not run the job' do
        ActiveJob.quiet do
          expect { RequestSnapshotJob.perform_now }.to raise_error(NoActiveUsersError)
        end
      end
    end

    context 'with an admin' do
      let!(:ftp_credential) { create(:ftp_credential) }
      let!(:admin) { create(:confirmed_user) }

      it 'requests the snapshot' do
        expect_any_instance_of(FtpCredential).to receive(:request_snapshot).once
        RequestSnapshotJob.perform_now
      end
    end
  end
end
