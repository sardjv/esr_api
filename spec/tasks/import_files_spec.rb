require 'rake'

describe 'rake import_files' do
  before { EsrApi::Application.load_tasks }

  context 'with disordered filenames' do
    let(:imports_path) { 'spec/fixtures/files/disordered_imports' }
    let(:first) { Rails.root.join(imports_path, '4_20190101_00000001.DAT').to_s }
    let(:second) { Rails.root.join(imports_path, '2_20200602_00001631.DAT').to_s }
    let(:third) { Rails.root.join(imports_path, '1_20200602_00001632.DAT').to_s }
    let(:fourth) { Rails.root.join(imports_path, '3_20221223_00001791.DAT').to_s }

    it 'creates jobs in date and time order' do
      expect(ImportFileJob).to receive(:perform_later).with(filename: first).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: second).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: third).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: fourth).ordered

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
