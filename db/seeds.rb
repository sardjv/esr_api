# Import some test data for demonstration purposes.
FakeDataJob.perform_later(klass: 'AbsenceRecord', quantity: 500)
ftp_credential = FactoryBot.create(:ftp_credential, path: 'good_imports/mixed_import')
ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id)
ftp_credential.delete
