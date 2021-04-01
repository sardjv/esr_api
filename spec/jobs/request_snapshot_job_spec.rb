describe RequestSnapshotJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let!(:ftp_credential) { create(:ftp_credential) }

  describe 'perform' do
    it 'requests the snapshot' do
      expect_any_instance_of(FtpCredential).to receive(:request_snapshot).once
      RequestSnapshotJob.perform_now
    end
  end
end
