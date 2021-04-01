describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let!(:ftp_credential) { create(:ftp_credential, path: path) }

  context 'with multiple files' do
    let(:path) { 'good_imports/multiple_files' }

    it 'sends request to delete the files from the remote' do
      expect_any_instance_of(FtpCredential).to receive(:delete_from_ftp).once
      ImportFromFtpJob.perform_now
    end
  end
end
