require 'rails_helper'

describe DataHelper do
  describe '.imported_filenames' do
    let!(:imported1) { create(:location_record) }
    let!(:imported2) { create(:location_record) }
    let!(:not_imported1) { create(:location_record) }
    let!(:not_imported2) { create(:location_record) }
    let(:filenames) { ['filename1', 'filename2'] }

    before do
      imported1.versions.first.update(whodunnit_type: 'Import', whodunnit: filenames[0])
      imported2.versions.first.update(whodunnit_type: 'Import', whodunnit: filenames[1])
      not_imported1.versions.first.update(whodunnit_type: 'User', whodunnit: 'Anne')
    end

    it 'returns filenames which have been imported' do
      expect(DataHelper.imported_filenames).to match_array(filenames)
    end
  end

  describe '.grouped_routes' do
    it 'includes all routes' do
      expect(DataHelper.grouped_routes).to eq(
        {
          'A' => [
            { name: 'Absence Records', path: 'absence_records' },
            { name: 'Assignment Records', path: 'assignment_records' }
          ],
          'C' => [
            { name: 'Competency Records', path: 'competency_records' },
            { name: 'Costing Records', path: 'costing_records' }
          ],
          'D' => [
            { name: 'Disability Records', path: 'disability_records' }
          ],
          'E' => [
            { name: 'Element Records', path: 'element_records' }
          ],
          'L' => [
            { name: 'Location Records', path: 'location_records' }
          ],
          'O' => [
            { name: 'Organisation Records', path: 'organisation_records' }
          ],
          'P' => [
            { name: 'Person Eit Records', path: 'person_eit_records' },
            { name: 'Person Records', path: 'person_records' },
            { name: 'Position Eit Records', path: 'position_eit_records' },
            { name: 'Position Records', path: 'position_records' }
          ],
          'Q' => [
            { name: 'Qualification Records', path: 'qualification_records' }
          ],
          'S' => [
            { name: 'Sit Records', path: 'sit_records' }
          ],
          'T' => [
            { name: 'Training Absence Records', path: 'training_absence_records' }
          ]
        }
      )
    end
  end
end
