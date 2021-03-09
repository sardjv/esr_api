describe Source, type: :model do
  subject { build(:source) }

  it { expect(subject).to be_valid }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_presence_of(:source) }
  it { should have_db_index(:source_ciphertext).unique }
  it { should have_db_index(:name).unique }
  it { should belong_to(:created_by) }

  context 'with the source the same as the name (ignoring capitalisation and whitespace)' do
    before { subject.assign_attributes(name: 'WWW.exam ple.com', source: 'www.example.com') }

    it 'fails; sources should be secret' do
      expect(subject).not_to be_valid
    end
  end

  context 'with a persisted source' do
    subject! { create(:source) }

    describe 'updating the source' do
      it 'fails; sources should be immutable' do
        expect { subject.update!(source: 'www.example.com') }.to raise_error(ActiveRecord::ReadOnlyRecord)
      end
    end

    describe 'a second source' do
      let(:second_source) { build(:source) }

      it 'is invalid' do
        expect(second_source).not_to be_valid
        expect(second_source.errors[:source]).to include(I18n.t('models.source.errors.must_be_singleton'))
      end
    end
  end
end
