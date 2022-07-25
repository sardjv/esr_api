# == Schema Information
#
# Table name: organisation_records
#
#  id                          :bigint           not null, primary key
#  Organisation ID             :string(255)
#  Organisation Name           :string(255)
#  Organisation Type           :string(255)
#  Effective From Date         :date
#  Effective To Date           :date
#  Hierarchy Version ID        :string(255)
#  Hierarchy Version Date From :date
#  Hierarchy Version Date To   :date
#  Default Cost Centre         :string(255)
#  Parent Organisation ID      :string(255)
#  NACS Code                   :string(255)
#  Location ID                 :string(255)
#  Last Update Date            :datetime
#  Cost Centre Description     :string(255)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class OrganisationRecord < ApplicationRecord
    belongs_to :location, class_name: 'LocationRecord', foreign_key: 'Location ID', primary_key: 'Location ID', optional: true
    belongs_to :parent, class_name: 'OrganisationRecord', foreign_key: 'Parent Organisation ID', primary_key: 'Organisation ID', optional: true
    has_many :children, class_name: 'OrganisationRecord', foreign_key: 'Parent Organisation ID', primary_key: 'Organisation ID'
    has_many :positions, class_name: 'PositionRecord', foreign_key: 'Organisation ID', primary_key: 'Organisation ID'
    has_many :assignments, class_name: 'AssignmentRecord', foreign_key: 'Organisation ID', primary_key: 'Organisation ID'
    has_many :active_assignments, -> { no_effective_end_date }, class_name: 'AssignmentRecord', foreign_key: 'Organisation ID', primary_key: 'Organisation ID'
    has_many :people, through: :assignments, class_name: 'PersonRecord'
    has_many :actively_assigned_people, through: :active_assignments, class_name: 'PersonRecord'
end
