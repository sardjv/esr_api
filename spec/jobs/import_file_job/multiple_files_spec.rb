describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:ftp_credential) { create(:ftp_credential, path: path) }
  let(:import_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }

  context 'with multiple files' do
    let(:path) { 'good_imports/multiple_files' }

    it 'parses and creates records from all' do
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
    let(:path) { '/disordered_imports' }

    it 'creates jobs in date and time order, not alphabetically' do
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '4_20190101_00000001.DAT', row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '2_20200602_00001631.DAT', row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '1_20200602_00001632.DAT', row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '3_20221231_00001791.DAT', row: anything).ordered

      perform_enqueued_jobs { import_job }
    end
  end

  context 'with a filename without a timestamp' do
    let(:path) { '/imports_missing_a_timestamp' }

    it 'raises InvalidFilenameError' do
      expect do
        ImportFromFtpJob.new.perform(ftp_credential_id: ftp_credential.id)
      end.to raise_error(InvalidFilenameError)
    end
  end
end
