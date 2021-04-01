describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let!(:ftp_credential) { create(:ftp_credential, path: path) }

  context 'with 2 files' do
    let(:path) { 'good_imports/multiple_files' }

    it 'sends request to delete the files from the remote' do
      expect_any_instance_of(Ftpmock::NetFtpProxy).to receive(:delete).twice
      ImportFromFtpJob.perform_now
    end
  end
end
