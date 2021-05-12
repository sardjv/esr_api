# == Schema Information
#
# Table name: costing_records
#
#  id                    :bigint           not null, primary key
#  Person ID             :string(255)
#  Assignment ID         :string(255)
#  Costing Allocation ID :string(255)
#  Effective Start Date  :date
#  Effective End Date    :date
#  Entity Code           :string(255)
#  Charitable Indicator  :string(255)
#  Cost Centre           :string(255)
#  Subjective            :string(255)
#  Analysis 1            :string(255)
#  Analysis 2            :string(255)
#  Element Number        :string(255)
#  Spare Segment         :string(255)
#  Percentage Split      :string(255)
#  Last Update Date      :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
describe CostingRecord, type: :model do
  it { expect(CostingRecord.new).to be_valid }
end
