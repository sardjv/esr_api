describe Token, type: :model do
  subject { build(:token) }

  it { expect(subject).to be_valid }

  it { should validate_presence_of(:encrypted_token) }
  it { should have_db_index(:encrypted_token).unique }
  it { should belong_to(:created_by) }
end
