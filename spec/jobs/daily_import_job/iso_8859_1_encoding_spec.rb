describe DailyImportJob, type: :job do
  let(:add_filename) { file_fixture('iso_8859_1_encoding.DAT').to_path }
  let(:add_job) { DailyImportJob.perform_later(filename: add_filename) }

  it 'creates a new LocationRecord' do
    perform_enqueued_jobs { add_job }

    expect(LocationRecord.count).to eq(1)
    pr = LocationRecord.first

    # Expect values in the database to match input from iso_8859_1_encoding.DAT.
    Expectations::Iso88591Encoding.added.each do |key, value|
      expect(pr.send(key)).to eq(value)
    end
  end
end
