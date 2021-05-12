# == Schema Information
#
# Table name: permissions
#
#  id           :bigint           not null, primary key
#  subject_type :string(255)
#  subject_id   :bigint
#  resource     :string(255)      not null
#  action       :string(255)      not null
#  columns      :text(65535)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
describe Permission, type: :model do
  let(:token) { create(:token) }
  subject { token.permissions.first }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:resource) }
  it { should validate_presence_of(:action) }
  it { should validate_presence_of(:columns) }
  it { should validate_uniqueness_of(:subject_id).scoped_to(%i[resource action]) }
  it { should have_db_index(%i[subject_id resource action]).unique }
  it { should belong_to(:subject) }
  it { should validate_inclusion_of(:resource).in_array(Permission::RESOURCES) }
  it { should validate_inclusion_of(:action).in_array(Permission::ACTIONS) }

  context "with a column that doesn't match the resource" do
    subject do
      build(
        :permission,
        resource: 'AbsenceRecord',
        columns: 'Person ID,Certification Date'
      )
    end

    it 'is not valid' do
      subject.valid?
      expect(
        subject.errors[:columns]
      ).to include(
        I18n.t('models.permission.errors.column_not_found')
      )
    end
  end

  context 'with a persisted token' do
    describe 'updating the permission' do
      it 'fails; tokens should be immutable' do
        expect do
          subject.update(columns: PermissionHelper.column_options(resource: subject.resource))
        end.to raise_error(ActiveRecord::ReadOnlyRecord)
      end
    end
  end
end
