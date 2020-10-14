require 'rake'

describe 'rake import_files' do
  before { EsrApi::Application.load_tasks }

  context 'with some files' do
    let(:imports_path) { 'spec/fixtures/files' }

    it 'creates jobs to import the files' do
      expect(ImportFileJob).to receive(:perform_later).exactly(Dir.children(imports_path).count).times
      Rake::Task['import_files'].execute(imports_path: imports_path)
    end
  end
end
