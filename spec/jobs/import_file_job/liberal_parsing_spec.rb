describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:filename) { 'liberal_parsing_20201015_00001157.DAT' }
  let(:filepath) { file_fixture("good_imports/#{filename}").to_path }
  let(:ftp_credential) { create(
    :ftp_credential,
    host: '127.0.0.1',
    port: '21212',
    user: 'user',
    password: 'password',
    path: '/'
  ) }
  let(:add_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }

  before do
    # Upload to 'FTP'.

    ## 21212 is the control port, which is used by FTP for the primary connection.
    ## 21213 is the data port, used in FTP passive mode to send file contents.
    @ftp_server = FakeFtp::Server.new(ftp_credential.port.to_i, 21213)
    @ftp_server.start
    connection = Net::FTP.new
    connection.connect(ftp_credential.host, ftp_credential.port.to_i)
    connection.login(ftp_credential.user, ftp_credential.password)
    connection.passive = true
    connection.put(filepath)
    connection.close
  end

  after do
    @ftp_server.stop
  end

  context 'with a row with quotes inside a column' do

    # Pass FTP path to ImportFromFtpJob
    it 'parses liberally and creates a new LocationRecord' do
      perform_enqueued_jobs { add_job }

      expect(LocationRecord.count).to eq(1)
      pr = LocationRecord.first

      # Expect values in the database to match input from liberal_parsing_20201015_00001157.DAT.
      Expectations::LiberalParsing.added.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end
  end
end
