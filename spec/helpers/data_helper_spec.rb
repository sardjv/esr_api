require 'rails_helper'

describe DataHelper do
  describe '.grouped_routes' do
    it 'includes all routes' do
      expect(DataHelper.grouped_routes).to eq(
        {
          'A' => [
            { name: 'Absence Records', path: 'ui/absence_records' },
            { name: 'Assignment Records', path: 'ui/assignment_records' }
          ],
          'C' => [
            { name: 'Competency Records', path: 'ui/competency_records'},
            { name: 'Costing Records', path: 'ui/costing_records'}
          ],
          'D' => [
            { name: 'Disability Records', path: 'ui/disability_records'}
          ],
          'E' => [
            { name: 'Element Records', path: 'ui/element_records'}
          ],
          'L' => [
            { name: 'Location Records', path: 'ui/location_records'}
          ],
          'O' => [
            { name: 'Organisation Records', path: 'ui/organisation_records'}
          ],
          'P' => [
            { name: 'Person Eit Records', path: 'ui/person_eit_records'},
            { name: 'Person Records', path: 'ui/person_records'},
            { name: 'Position Eit Records', path: 'ui/position_eit_records'},
            { name: 'Position Records', path: 'ui/position_records'}
          ],
          'Q' => [
            { name: 'Qualification Records', path: 'ui/qualification_records'}
          ],
          'S' => [
            { name: 'Sit Records', path: 'ui/sit_records'}
          ],
          'T' => [
            { name: 'Training Absence Records', path: 'ui/training_absence_records'}
          ]
        }
      )
    end
  end
end
