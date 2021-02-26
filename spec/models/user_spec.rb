describe User, type: :model do
  subject { build(:user) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:tokens).inverse_of(:created_by).dependent(:restrict_with_error) }
  it { should have_many(:sources).inverse_of(:created_by).dependent(:restrict_with_error) }

  context 'with a confirmed user' do
    subject! { create(:user) }

    it 'does not require confirmation' do
      assert(subject.activated)
      assert(subject.point_of_contact)
    end

    describe 'the next user' do
      let!(:user2) { create(:user) }

      it 'requires confirmation' do
        refute(user2.activated)
        refute(user2.point_of_contact)
      end

      describe 'deactivation' do
        before { subject.update(confirmed_at: nil) }

        it 'is not possible, as the system must always have at least 1 active user' do
          expect(subject).not_to be_valid
          assert(subject.reload.confirmed_at)
        end
      end

      describe 'removal of point of contact' do
        before { subject.update(point_of_contact: false) }

        it 'is not possible, as the system must always have at least 1 point of contact' do
          expect(subject).not_to be_valid
          assert(subject.reload.point_of_contact)
        end
      end
    end
  end
end
