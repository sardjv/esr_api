describe User, type: :model do
  subject { build(:user) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:tokens).inverse_of(:created_by).dependent(:restrict_with_exception) }

  context 'with a confirmed user' do
    subject! { create(:confirmed_user) }

    describe 'deactivation' do
      it 'is not valid, as the system must always have at least 1 active user' do
        expect(User.count).to eq(1)
        subject.update(confirmed_at: nil)
        expect(subject).not_to be_valid
        subject.reload
        expect(subject.confirmed_at).not_to eq(nil)
      end
    end
  end
end
