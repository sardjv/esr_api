describe Source, type: :model do
  subject { build(:source) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_presence_of(:source) }
  it { should have_db_index(:source_ciphertext).unique }
  it { should have_db_index(:name).unique }
  it { should belong_to(:created_by) }

  context 'with a persisted source' do
    subject { create(:source) }

    describe 'updating the source' do
      before { subject.assign_attributes(source: 'www.example.com') }

      it 'fails; sources should be immutable' do
        expect { subject.save! }.to raise_error(ActiveRecord::ReadOnlyRecord)
      end
    end
  end
end
