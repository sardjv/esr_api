# == Schema Information
#
# Table name: competency_records
#
#  id                        :bigint           not null, primary key
#  Person ID                 :string(255)
#  Competency Element ID     :string(255)
#  Competency Type           :string(255)
#  Competency Status         :string(255)
#  Competency Name           :string(255)
#  Date From                 :date
#  Date To                   :date
#  Proficiency Level         :string(255)
#  VPD Code                  :string(255)
#  Certification Date        :date
#  Certification Method      :string(255)
#  Next Certification Date   :date
#  Competence ID             :string(255)
#  Business Group ID         :string(255)
#  Job ID                    :string(255)
#  Organisation ID           :string(255)
#  Position ID               :string(255)
#  Proficiency Level ID      :string(255)
#  Proficiency High Level ID :string(255)
#  Essential Flag            :string(255)
#  Records Type              :string(255)
#  Last Update Date          :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
describe CompetencyRecord, type: :model do
  it { expect(CompetencyRecord.new).to be_valid }
end
