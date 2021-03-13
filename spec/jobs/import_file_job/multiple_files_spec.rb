describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:ftp_credential) { create(
    :ftp_credential,
    host: '127.0.0.1',
    port: '21212',
    user: 'user',
    password: 'password',
    path: '/'
  ) }
  let(:import_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }

  before do
    # Upload files to 'FTP'.

    ## 21212 is the control port, which is used by FTP for the primary connection.
    ## 21213 is the data port, used in FTP passive mode to send file contents.
    @ftp_server = FakeFtp::Server.new(ftp_credential.port.to_i, 21213)
    @ftp_server.start
    connection = Net::FTP.new
    connection.connect(ftp_credential.host, ftp_credential.port.to_i)
    connection.login(ftp_credential.user, ftp_credential.password)
    connection.passive = true
    filepaths.each do |filepath|
      connection.put(filepath)
    end
    connection.close
  end

  after do
    @ftp_server.stop
  end

  context 'with 2 files' do
    let(:filename1) { 'add_absence_record_20201015_00001157.DAT' }
    let(:filename2) { 'add_assignment_record_20201015_00001157.DAT' }
    let(:filepath1) { file_fixture("good_imports/#{filename1}").to_path }
    let(:filepath2) { file_fixture("good_imports/#{filename2}").to_path }
    let(:filepaths) { [filepath1, filepath2] }

    it 'parses and creates records from both' do
      perform_enqueued_jobs { import_job }

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

  context 'with disordered filenames' do
    let(:imports_path) { 'spec/fixtures/files/disordered_imports' }
    let(:filename1) { '4_20190101_00000001.DAT' }
    let(:filename2) { '2_20200602_00001631.DAT' }
    let(:filename3) { '1_20200602_00001632.DAT' }
    let(:filename4) { '3_20221231_00001791.DAT' }
    let(:filepath1) { file_fixture("disordered_imports/#{filename1}").to_path }
    let(:filepath2) { file_fixture("disordered_imports/#{filename2}").to_path }
    let(:filepath3) { file_fixture("disordered_imports/#{filename3}").to_path }
    let(:filepath4) { file_fixture("disordered_imports/#{filename4}").to_path }
    let(:filepaths) { [filepath1, filepath2, filepath3, filepath4] }

    it 'creates jobs in date and time order' do
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: filename1, row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: filename2, row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: filename3, row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: filename4, row: anything).ordered

      perform_enqueued_jobs { import_job }
    end
  end

  context 'with a filename without a timestamp' do
    let(:filename1) { 'missing_timestamp.DAT' }
    let(:filepath1) { file_fixture("imports_missing_a_timestamp/#{filename1}").to_path }
    let(:filepaths) { [filepath1] }

    it 'raises InvalidFilenameError' do
      expect do
        ImportFromFtpJob.new.perform(ftp_credential_id: ftp_credential.id)
      end.to raise_error(InvalidFilenameError)
    end
  end
end
