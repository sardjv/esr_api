describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:filename1) { 'add_absence_record_20201015_00001157.DAT' }
  let(:filename2) { 'add_assignment_record_20201015_00001157.DAT' }
  let(:filepath1) { file_fixture("good_imports/#{filename1}").to_path }
  let(:filepath2) { file_fixture("good_imports/#{filename2}").to_path }
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
    connection.put(filepath1)
    connection.put(filepath2)
    connection.close
  end

  after do
    @ftp_server.stop
  end

  context 'with a row with quotes inside a column' do

    it 'parses liberally and creates a new LocationRecord' do
      perform_enqueued_jobs { add_job }

      # Expect values in the database to match inputs.
      absence_record = AbsenceRecord.first
      Expectations::AbsenceRecord.added.each do |key, value|
        expect(absence_record.send(key)).to eq(value)
      end
      assignment_record = AssignmentRecord.first
      Expectations::AssignmentRecord.added.each do |key, value|
        expect(assignment_record.send(key)).to eq(value)
      end
    end
  end
end
