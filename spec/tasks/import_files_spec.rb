require 'rake'

describe 'rake import_files' do
  before { EsrApi::Application.load_tasks }

  context 'with filenames with timestamps' do
    let(:imports_path) { 'spec/fixtures/files/good_imports' }

    it 'creates jobs to import the files' do
      expect(ImportFileJob).to receive(:perform_later).exactly(Dir.children(imports_path).count).times
      Rake::Task['import_files'].execute(imports_path: imports_path)
    end

    it 'creates jobs ordered by timestamp' do
      # Check ordered by date
      # Check ordered by time
    end
  end

  context 'with a filename without a timestamp' do
    let(:imports_path) { 'spec/fixtures/files/imports_missing_a_timestamp' }

    it 'raises InvalidFilenameError' do
      expect(ImportFileJob).not_to receive(:perform_later)

      expect do
        Rake::Task['import_files'].execute(imports_path: imports_path)
      end.to raise_error(InvalidFilenameError)
    end
  end
end
