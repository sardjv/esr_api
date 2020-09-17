describe Permission, type: :model do
  subject { build(:permission, subject_id: create(:token).id) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:resource) }
  it { should validate_presence_of(:action) }
  it { should validate_presence_of(:columns) }
  it { should validate_uniqueness_of(:subject_id).scoped_to(%i[resource action]) }
  it { should have_db_index(%i[subject_id resource action]).unique }
  it { should belong_to(:subject) }
  it { should validate_inclusion_of(:resource).in_array(Permission::RESOURCES) }
  it { should validate_inclusion_of(:action).in_array(Permission::ACTIONS) }
end
