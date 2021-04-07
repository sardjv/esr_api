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

    context 'when 1 has already been downloaded' do
      let!(:absence_record) { create(:absence_record) }
      before { absence_record.versions.last.update(whodunnit_type: 'Import', whodunnit: 'add_absence_record_20201015_00001157.DAT') }

      it 'only imports from the file which has not been imported before' do
        expect(ImportAbsenceRecordJob).not_to receive(:perform_later).with(filename: 'add_absence_record_20201015_00001157.DAT', row: anything)
        expect(ImportAssignmentRecordJob).to receive(:perform_later).with(filename: 'add_assignment_record_20201015_00001157.DAT', row: anything)

        perform_enqueued_jobs { import_job }
      end
    end
  end

  context 'with disordered filenames' do
    let(:path) { 'good_imports/disordered_imports' }

    it 'creates jobs in date and time order, not alphabetically' do
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '4_20190101_00000001.DAT', row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '2_20200602_00001631.DAT', row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '1_20200602_00001632.DAT', row: anything).ordered
      expect(ImportAbsenceRecordJob).to receive(:perform_later).with(filename: '3_20221231_00001791.DAT', row: anything).ordered

      perform_enqueued_jobs { import_job }
    end
  end

  context 'with a filename without a timestamp' do
    let(:path) { 'bad_imports/imports_missing_a_timestamp' }

    it 'raises InvalidFilenameError' do
      ActiveJob.quiet do
        expect { ImportFromFtpJob.perform_now(ftp_credential_id: ftp_credential.id) }.to raise_error(InvalidFilenameError)
      end
    end
  end
end
