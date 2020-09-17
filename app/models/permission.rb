class Permission < ApplicationRecord
  RESOURCES = %w[
    AbsenceRecord
    AssignmentRecord
    CompetencyRecord
    CostingRecord
    DisabilityRecord
    ElementRecord
    LocationRecord
    OrganisationRecord
    PersonEitRecord
    PersonRecord
    PositionEitRecord
    PositionRecord
    QualificationRecord
    SitRecord
    TrainingAbsenceRecord
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
  validate :columns_match_resource

  def columns_match_resource
    return if columns &&
              Permission::RESOURCES.include?(resource) &&
              (columns.split(',') - resource.constantize.column_names).empty?

    errors.add(:columns, I18n.t('models.permission.errors.column_not_found'))
  end
end
