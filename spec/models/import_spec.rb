describe Import, type: :model do
  subject { build(:import) }

  it { expect(subject).to be_valid }

  it { should validate_presence_of(:name) }
end
