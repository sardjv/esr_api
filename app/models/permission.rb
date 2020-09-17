class Permission < ApplicationRecord
  RESOURCES = %w[
    absence_records
    assignment_records
    competency_records
    costing_records
    disability_records
    element_records
    location_records
    organisation_records
    person_eit_records
    person_records
    position_eit_records
    position_records
    qualification_records
    sit_records
    training_absence_records
  ].freeze
  ACTIONS = %w[
    index
    show
  ].freeze

  belongs_to :subject, polymorphic: true

  validates :subject_id, uniqueness: { scope: %i[resource action] }
  validates :resource, presence: true, inclusion: { in: RESOURCES }
  validates :action, presence: true, inclusion: { in: ACTIONS }
  validates :columns, presence: true
end
