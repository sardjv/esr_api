# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  point_of_contact       :boolean          default(FALSE), not null
#  time_zone              :string(255)      default("London"), not null
#
describe User, type: :model do
  subject { build(:user) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should have_many(:tokens).inverse_of(:created_by).dependent(:restrict_with_error) }
  it { should have_many(:ftp_credentials).inverse_of(:created_by).dependent(:restrict_with_error) }

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
