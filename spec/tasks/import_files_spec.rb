require 'rake'

describe 'rake import_files' do
  before { EsrApi::Application.load_tasks }

  context 'with filenames with timestamps' do
    let(:imports_path) { 'spec/fixtures/files/good_imports' }

    it 'creates jobs to import the files' do
      expect(ImportFileJob).to receive(:perform_later).exactly(Dir.children(imports_path).count).times
      Rake::Task['import_files'].execute(imports_path: imports_path)
    end
  end

  context 'with disordered filenames' do
    let(:imports_path) { 'spec/fixtures/files/disordered_imports' }
    let(:first_filename) { file_fixture('disordered_imports/4_20190101_00000001.DAT').to_path }
    let(:second_filename) { file_fixture('disordered_imports/2_20200602_00001631.DAT').to_path }
    let(:third_filename) { file_fixture('disordered_imports/1_20200602_00001632.DAT').to_path }
    let(:fourth_filename) { file_fixture('disordered_imports/3_20221223_00002032.DAT').to_path }

    it 'creates jobs in date and time order' do
      expect(ImportFileJob).to receive(:perform_later).with(filename: first_filename).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: second_filename).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: third_filename).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: fourth_filename).ordered

      Rake::Task['import_files'].execute(imports_path: imports_path)
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
