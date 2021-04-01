describe Ui::FtpCredentialsController, type: :request do
  let(:valid_attributes) { build(:ftp_credential).attributes }

  context 'when not authenticated' do
    describe 'GET new' do
      describe 'format.html' do
        before { get new_ui_ftp_credential_path }
        it { expect(response).to redirect_to(pages_home_path) }
      end

      describe 'format.json' do
        before { get new_ui_ftp_credential_path, xhr: true }
        it { expect(response).not_to be_successful }
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'GET new' do
      describe 'format.html' do
        before { get new_ui_ftp_credential_path }
        it { expect(response).to be_successful }
      end
    end
  end

  context 'when not authenticated' do
    describe 'POST create' do
      before { post ui_ftp_credentials_path, params: { ftp_credential: valid_attributes } }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not create a new ftp_credential' do
        expect { post ui_ftp_credentials_path, params: { ftp_credential: valid_attributes } }.not_to change(FtpCredential, :count)
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    describe 'POST create' do
      it 'creates a new ftp_credential' do
        expect do
          post ui_ftp_credentials_path, params: { ftp_credential: valid_attributes }
        end.to change { FtpCredential.count }.by(1)
        expect(FtpCredential.last.name).to eq(valid_attributes['name'])
        expect(FtpCredential.last.host).to eq(valid_attributes['host'])
      end

      it 'triggers a request for the initial snapshot from the remote FTP' do
        expect_any_instance_of(FtpCredential).to receive(:request_snapshot).once
        post ui_ftp_credentials_path, params: { ftp_credential: valid_attributes }
      end
    end
  end

  context 'when not authenticated' do
    let!(:ftp_credential) { create(:ftp_credential) }

    describe 'GET show' do
      before { get ui_ftp_credential_path(ftp_credential) }
      it { expect(response).to redirect_to(pages_home_path) }
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let!(:ftp_credential) { create(:ftp_credential) }

    describe 'GET show' do
      before { get ui_ftp_credential_path(ftp_credential) }
      it { expect(response).to be_successful }

      it 'doees NOT includes the decrypted ftp_credential' do
        expect(response.body).not_to include(ftp_credential.password)
      end
    end
  end

  context 'when not authenticated' do
    let!(:ftp_credential) { create(:ftp_credential) }

    describe 'DELETE destroy' do
      before { delete ui_ftp_credential_path(ftp_credential) }

      it { expect(response).to redirect_to(pages_home_path) }

      it 'does not delete the ftp_credential' do
        expect { delete ui_ftp_credential_path(ftp_credential) }.not_to change(FtpCredential, :count)
      end
    end
  end

  context 'when authenticated' do
    before { sign_in create(:confirmed_user) }

    let!(:ftp_credential) { create(:ftp_credential) }

    describe 'DELETE destroy' do
      it 'deletes the ftp_credential' do
        expect { delete ui_ftp_credential_path(ftp_credential) }.to change { FtpCredential.count }.by(-1)
      end
    end
  end
end
