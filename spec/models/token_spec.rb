describe Token, type: :model do
  subject { build(:token) }

  it { expect(subject).to be_valid }

  it { should validate_presence_of(:token) }
  it { should have_db_index(:token_ciphertext).unique }
  it { should belong_to(:created_by) }
end
