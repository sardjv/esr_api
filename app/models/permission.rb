class Permission < ApplicationRecord
  # Add enums for resource and action

  belongs_to :subject, polymorphic: true

  validates :subject_id, uniqueness: { scope: %i[resource action] }
  validates :resource, presence: true
  validates :action, presence: true
  validates :columns, presence: true
end
