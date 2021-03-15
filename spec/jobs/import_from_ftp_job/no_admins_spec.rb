describe ImportFromFtpJob, type: :job do
  # rubocop:disable Rails/SkipsModelValidations
  let(:unconfirmed_user) { create(:user) { |u| u.update_column(:confirmed_at, nil) } }
  # rubocop:enable Rails/SkipsModelValidations
  let(:ftp_credential) { create(:ftp_credential, path: path, created_by_id: unconfirmed_user.id) }
  let(:path) { 'good_imports/mixed_import' }

  context 'with no admins' do
    it 'does not run the job' do
      ActiveJob.quiet do
        expect { ImportFromFtpJob.perform_now(ftp_credential_id: ftp_credential.id) }.to raise_error(NoActiveUsersError)
      end
    end
  end
end
