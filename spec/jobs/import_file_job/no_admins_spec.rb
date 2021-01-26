describe ImportFileJob, type: :job do
  let(:filename) { file_fixture('good_imports/mixed_import_20201015_00001157.DAT').to_path }

  context 'with no admins' do
    it 'does not run the job' do
      ActiveJob.quiet do
        expect{ ImportFileJob.perform_now(filename: filename) }.to raise_error(NoActiveUsersError)
      end
    end
  end
end
