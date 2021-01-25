describe User, type: :model do
  subject { build(:user) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:tokens).inverse_of(:created_by) }

  context 'with a confirmed user' do
    subject! { create(:user) }

    it 'does not require confirmation' do
      assert(subject.activated)
    end

    describe 'the next user' do
      let(:user2) { create(:user) }

      it 'requires confirmation' do
        refute(user2.activated)
      end
    end

    describe 'deactivation' do
      it 'is not possible, as the system must always have at least 1 active user' do
        expect(User.count).to eq(1)
        subject.update(confirmed_at: nil)
        expect(subject).not_to be_valid
        subject.reload
        expect(subject.confirmed_at).not_to eq(nil)
      end
    end
  end
end
