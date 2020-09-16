describe Token, type: :model do
  subject { build(:token) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:created_by_id) }
  it { should validate_presence_of(:token) }
  it { should have_db_index(:token_ciphertext).unique }
  it { should have_db_index(%i[name created_by_id]).unique }
  it { should belong_to(:created_by) }

  describe '.verify' do
    let!(:token) { create(:token) }

    it 'verifies token exists' do
      expect(Token.verify(token.token)).to eq(true)
    end

    it 'raises error with unknown token ' do
      expect { Token.verify('1234') }.to raise_error(VerificationError)
    end
  end
end
