require 'rails_helper'

describe DataHelper do
  describe '.grouped_routes' do
    it 'includes all routes' do
      expect(DataHelper.grouped_routes).to eq(
        {
          'A' => %w[absence_records assignment_records],
          'C' => %w[competency_records costing_records],
          'D' => %w[disability_records],
          'E' => %w[element_records],
          'L' => %w[location_records],
          'O' => %w[organisation_records],
          'P' => %w[person_eit_records person_records position_eit_records position_records],
          'Q' => %w[qualification_records],
          'S' => %w[sit_records],
          'T' => %w[training_absence_records]
        }
      )
    end
  end
end
