# == Schema Information
#
# Table name: assignment_records
#
#  id                                :bigint           not null, primary key
#  Person ID                         :string(255)
#  Assignment ID                     :string(255)
#  Effective Start Date              :date
#  Effective End Date                :date
#  Earliest Assignment Start Date    :date
#  Assignment Type                   :string(255)
#  Assignment Number                 :string(255)
#  System Assignment Status          :string(255)
#  User Assignment Status            :string(255)
#  Employee Status Flag              :string(255)
#  Payroll Name                      :string(255)
#  Payroll Period Type               :string(255)
#  Assignment Location ID            :string(255)
#  Supervisor Flag                   :string(255)
#  Supervisor Person ID              :string(255)
#  Supervisor Assignment ID          :string(255)
#  Supervisor Assignment Number      :string(255)
#  Department Manager Person ID      :string(255)
#  Employee Category                 :string(255)
#  Assignment Category               :string(255)
#  Primary Assignment                :string(255)
#  Normal Hours / Sessions           :string(255)
#  Frequency                         :string(255)
#  Grade Contract Hours              :string(255)
#  FTE                               :string(255)
#  Flexible Working Pattern          :string(255)
#  Organisation ID                   :string(255)
#  Position ID                       :string(255)
#  Position Name                     :string(255)
#  Grade                             :string(255)
#  Grade Step                        :string(255)
#  Start Date in Grade               :date
#  Annual Salary Value               :string(255)
#  Job Name                          :string(255)
#  People Group                      :string(255)
#  T&A Flag                          :string(255)
#  Assignment Night Worker Attribute :string(255)
#  Projected Hire Date               :date
#  Vacancy ID                        :string(255)
#  Contract End Date                 :date
#  Increment Date                    :date
#  Maximum Part Time Flag            :string(255)
#  AFC Flag                          :string(255)
#  Last Update Date                  :datetime
#  Last Working Day                  :date
#  e-KSF Spinal Point                :string(255)
#  Manager Flag                      :string(255)
#  Assignment End Date               :date
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
class AssignmentRecord < ApplicationRecord
    belongs_to :person, class_name: 'PersonRecord', foreign_key: 'Person ID', primary_key: 'Person ID'
    belongs_to :position, class_name: 'PositionRecord', foreign_key: 'Position ID', primary_key: 'Position ID'
    belongs_to :location, class_name: 'LocationRecord', foreign_key: 'Assignment Location ID', primary_key: 'Location ID'
end
