# == Schema Information
#
# Table name: position_records
#
#  id                          :bigint           not null, primary key
#  Position ID                 :string(255)
#  Effective From Date         :date
#  Effective To Date           :date
#  Position Number             :string(255)
#  Position Name               :string(255)
#  Budgeted FTE                :string(255)
#  Subjective Code             :string(255)
#  Job Staff Group             :string(255)
#  Job Role                    :string(255)
#  Occupation Code             :string(255)
#  Payscale                    :string(255)
#  Grade Step                  :string(255)
#  ISA Regulated Post          :string(255)
#  Organisation ID             :string(255)
#  Hiring Status               :string(255)
#  Position Type               :string(255)
#  Workplace Org Code          :string(255)
#  Last Update Date            :datetime
#  Subjective Code Description :string(255)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class PositionRecord < ApplicationRecord
  has_many :assignment_records, foreign_key: 'Position ID', primary_key: 'Position ID'
end
