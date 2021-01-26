describe ImportFileJob, type: :job do
  let!(:admin) { create(:confirmed_user) }
  let(:add_filename) { file_fixture('good_imports/iso_8859_1_encoding_20201015_00001157.DAT').to_path }
  let(:add_job) { ImportFileJob.perform_later(filename: add_filename) }

  it 'creates a new LocationRecord' do
    perform_enqueued_jobs { add_job }

    expect(LocationRecord.count).to eq(1)
    pr = LocationRecord.first

    # Expect values in the database to match input from iso_8859_1_encoding_20201015_00001157.DAT.
    Expectations::Iso88591Encoding.added.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end
end
