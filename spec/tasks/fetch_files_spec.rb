require 'rake'

describe 'rake fetch_files' do
  before { EsrApi::Application.load_tasks }

  context 'with files on ftp' do
    let(:imports_path) { 'spec/fixtures/files/disordered_imports' }
    let(:first) { Rails.root.join(imports_path, '4_20190101_00000001.DAT').to_s }
    let(:second) { Rails.root.join(imports_path, '2_20200602_00001631.DAT').to_s }
    let(:third) { Rails.root.join(imports_path, '1_20200602_00001632.DAT').to_s }
    let(:fourth) { Rails.root.join(imports_path, '3_20221231_00001791.DAT').to_s }

    it 'downloads the files' do
      expect(ImportFileJob).to receive(:perform_later).with(filename: first).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: second).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: third).ordered
      expect(ImportFileJob).to receive(:perform_later).with(filename: fourth).ordered

      Rake::Task['import_files'].execute(imports_path: imports_path)
    end

    it 'creates a record of the update' do

    end

    context 'with duplicates' do
      it 'does not create duplicates' do

      end
    end
  end
end
