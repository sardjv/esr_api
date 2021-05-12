# == Schema Information
#
# Table name: absence_records
#
#  id                                :bigint           not null, primary key
#  Person ID                         :string(255)
#  Absence Attendance ID             :string(255)
#  Absence Type                      :string(255)
#  Absence Reason                    :string(255)
#  Status                            :string(255)
#  Notification Date                 :date
#  Projected Start Date              :date
#  Projected Start Time              :string(255)
#  Projected End Date                :date
#  Projected End Time                :string(255)
#  Actual Start Date                 :date
#  Actual Start Time                 :string(255)
#  Actual End Date                   :date
#  Actual End Time                   :string(255)
#  Sickness Start Date               :date
#  Sickness Date End                 :date
#  Absence Duration Days             :string(255)
#  Absence Duration Hours            :string(255)
#  Absence Units                     :string(255)
#  Hours Lost                        :string(255)
#  Sessions Lost                     :string(255)
#  Work Related                      :string(255)
#  Third Party                       :string(255)
#  Disability Related                :string(255)
#  Violence Aggression Related       :string(255)
#  Notifiable Disease                :string(255)
#  Return To Work Discussion Date    :date
#  Occupational Health Referral Date :date
#  Last Update Date                  :datetime
#  Surgery Related                   :string(255)
#  DH Monitoring                     :string(255)
#  Sickness Reason                   :string(255)
#  3rd Party System Reference        :string(255)
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
describe AbsenceRecord, type: :model do
  it { expect(AbsenceRecord.new).to be_valid }
end
