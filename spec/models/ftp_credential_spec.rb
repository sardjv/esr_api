describe FtpCredential, type: :model do
  subject { build(:ftp_credential) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should have_db_index(:name).unique }
  it { should validate_presence_of(:host) }
  it { should have_db_index(:host_ciphertext).unique }
  it { should validate_presence_of(:port) }
  it { should have_db_index(:port_ciphertext).unique }
  it { should validate_presence_of(:user) }
  it { should have_db_index(:user_ciphertext).unique }
  it { should validate_presence_of(:password) }
  it { should have_db_index(:password_ciphertext).unique }
  it { should validate_presence_of(:path) }
  it { should have_db_index(:path_ciphertext).unique }
  it { should validate_presence_of(:virtual_private_database_number) }
  it { should validate_length_of(:virtual_private_database_number).is_equal_to(3) }
  it { should belong_to(:created_by) }

  context 'with the ftp_credential containing the password (ignoring capitalisation and whitespace)' do
    before { subject.assign_attributes(name: 'The password is: SE cRet!', password: 'secret') }

    it 'fails; credentials should be secret' do
      expect(subject).not_to be_valid
    end
  end

  context 'with a persisted ftp_credential' do
    subject! { create(:ftp_credential) }

    describe 'updating the ftp_credential' do
      it 'fails; ftp_credential should be immutable' do
        expect { subject.update!(host: 'www.example.com') }.to raise_error(ActiveRecord::ReadOnlyRecord)
      end
    end

    describe 'a second ftp_credential' do
      let(:second_ftp_credential) { build(:ftp_credential) }

      it 'is invalid' do
        expect(second_ftp_credential).not_to be_valid
        expect(second_ftp_credential.errors[:host]).to include(I18n.t('models.ftp_credential.errors.must_be_singleton'))
      end
    end

    describe '#request_snapshot' do
      it 'puts a request file on the FTP server' do
        Timecop.freeze do
          local_file = File.join(subject.local_uploads_path, subject.snapshot_request_filename)
          expect_any_instance_of(Net::FTP).to receive(:put).with(
            local_file,
            File.join(subject.remote_upload_path, subject.snapshot_request_filename)
          )
          subject.request_snapshot
          assert(File.exist?(local_file))
          File.read(local_file) do |line|
            expect(line).to eq(subject.snapshot_request_file_contents(filename: subject.snapshot_request_filename))
          end
        end
      end
    end

    describe '#snapshot_request_filename' do
      it 'is in the correct format' do
        expect(
          subject.snapshot_request_filename
        ).to eq(
          "GO_#{subject.virtual_private_database_number}_GDW_GDR_#{Time.current.strftime('%Y%m%d')}_00000001.DAT"
        )
      end
    end
  end
end
