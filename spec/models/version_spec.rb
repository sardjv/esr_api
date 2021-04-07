describe Version, type: :model do
  describe '.imported_filenames' do
    it 'returns filenames which have been imported' do
      expect(Version.imported_filenames).to match_array([])
    end
  end
end
