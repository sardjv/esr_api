# == Schema Information
#
# Table name: tokens
#
#  id               :bigint           not null, primary key
#  name             :string(255)      not null
#  token_ciphertext :string(255)      not null
#  token_viewed_at  :datetime
#  created_by_id    :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token_bidx       :string(255)
#
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

  context 'with a persisted token' do
    subject { create(:token) }

    context 'when adding a new permission' do
      let(:permission) do
        build(
          :permission,
          resource: Permission::RESOURCES.last,
          action: Permission::ACTIONS.last,
          columns: 'Person ID'
        )
      end

      before { subject.permissions << permission }

      it 'fails; tokens should be immutable' do
        expect { subject.save! }.to raise_error(ActiveRecord::ReadOnlyRecord)
      end
    end
  end

  describe '.verify' do
    let!(:token) { create(:token, permissions: [permission]) }
    let(:permission) do
      build(
        :permission,
        resource: resource,
        action: action
      )
    end
    let(:resource) { Permission::RESOURCES.first }
    let(:action) { Permission::ACTIONS.first }

    context 'with nonexistent token' do
      it {
        expect do
          Token.verify(
            inbound_token: '1234',
            resource: resource,
            action: action
          )
        end.to raise_error(AuthenticationError)
      }
    end

    context 'with a permission with the wrong resource and action' do
      it {
        expect do
          Token.verify(
            inbound_token: token.token,
            resource: Permission::RESOURCES.last,
            action: Permission::ACTIONS.last
          )
        end.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the wrong resource' do
      it {
        expect do
          Token.verify(
            inbound_token: token.token,
            resource: Permission::RESOURCES.last,
            action: action
          )
        end.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the wrong action' do
      it {
        expect do
          Token.verify(
            inbound_token: token.token,
            resource: resource,
            action: Permission::ACTIONS.last
          )
        end.to raise_error(PermissionError)
      }
    end

    context 'with a permission with the right resource and action' do
      it {
        expect do
          Token.verify(
            inbound_token: token.token,
            resource: permission.resource,
            action: permission.action
          )
        end.not_to raise_error
      }
    end
  end
end
