describe ImportFileJob, type: :job do
  let(:add_filename) { file_fixture('liberal_parsing.DAT').to_path }
  let(:add_job) { ImportFileJob.perform_later(filename: add_filename) }

  context 'with a row with quotes inside a column' do
    it 'parses liberally and creates a new LocationRecord' do
      perform_enqueued_jobs { add_job }

      expect(LocationRecord.count).to eq(1)
      pr = LocationRecord.first

      # Expect values in the database to match input from liberal_parsing.DAT.
      Expectations::LiberalParsing.added.each do |key, value|
        expect(pr.send(key)).to eq(value)
      end
    end
  end
end
