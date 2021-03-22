describe ImportFromFtpJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:ftp_credential) { create(:ftp_credential, path: 'good_imports/iso_8859_1') }
  let(:import_job) { ImportFromFtpJob.perform_later(ftp_credential_id: ftp_credential.id) }

  context 'with iso_8859_1 encoding' do
    it 'parses and creates a new LocationRecord' do
      perform_enqueued_jobs { import_job }

      expect(LocationRecord.count).to eq(1)
      pr = LocationRecord.first

      # Expect values in the database to match input from iso_8859_1_encoding_20201015_00001157.DAT.
      Expectations::Iso88591Encoding.added.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end
  end
end
