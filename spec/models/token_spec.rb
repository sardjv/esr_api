describe Token, type: :model do
  subject { build(:token) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_presence_of(:token) }
  it { should have_db_index(:token_ciphertext).unique }
  it { should have_db_index(:name).unique }
  it { should belong_to(:created_by) }
  it { should have_many(:permissions).dependent(:destroy) }
  it { should accept_nested_attributes_for(:permissions).allow_destroy(true) }

  describe '.verify' do
    let!(:token) { create(:token) }
    let(:resource) { Permission::RESOURCES.first }
    let(:action) { Permission::ACTIONS.first }
    let!(:permission) {
      create(
        :permission,
        subject: token,
        resource: resource,
        action: action
      )
    }

    context 'with nonexistent token' do
      it {
        expect {
          Token.verify(
            inbound_token: '1234',
            resource: resource,
            action: action
          )
        }.to raise_error(AuthenticationError)
      }
    end

    context 'with no permissions' do
      let!(:permission) { nil }

      it {
        expect {
          Token.verify(
            inbound_token: token.token,
            resource: resource,
            action: action
          )
        }.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the wrong resource and action' do
      it {
        expect {
          Token.verify(
            inbound_token: token.token,
            resource: Permission::RESOURCES.last,
            action: Permission::ACTIONS.last
          )
        }.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the wrong resource' do
      it {
        expect {
          Token.verify(
            inbound_token: token.token,
            resource: Permission::RESOURCES.last,
            action: action
          )
        }.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the wrong action' do
      it {
        expect {
          Token.verify(
            inbound_token: token.token,
            resource: resource,
            action: Permission::ACTIONS.last
          )
        }.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the right resource and action' do
      it {
        expect {
          Token.verify(
            inbound_token: token.token,
            resource: permission.resource,
            action: permission.action
          )
        }.not_to raise_error
      }
    end
  end
end
