describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:ftp_credential) { create(:ftp_credential) }
  let(:import_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }
  let(:path) { 'good_imports/liberal_parsing' }
  before { stub_const('FtpCredential::REMOTE_DOWNLOADS_DIRECTORY', File.join(path, FtpCredential::REMOTE_DOWNLOADS_DIRECTORY)) }

  context 'with a row with quotes inside a column' do
    it 'parses liberally and creates a new LocationRecord' do
      perform_enqueued_jobs { import_job }

      expect(LocationRecord.count).to eq(1)
      pr = LocationRecord.first

      # Expect values in the database to match input from liberal_parsing_20201015_00001157.DAT.
      Expectations::LiberalParsing.added.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end
  end
end
