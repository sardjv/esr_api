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
FactoryBot.define do
  factory :absence_record do
    id { Faker::Number.unique.number }
    send('Person ID') { Faker::Number.unique.number }
    send('Absence Attendance ID') { Faker::Number.unique.number }
    send('Absence Type') { Faker::AbsenceRecord.absence_type }
    send('Absence Reason') { Faker::Alphanumeric.alpha(number: 3).upcase }
    send('Status') { Faker::Alphanumeric.alpha(number: 3).upcase }
    send('Notification Date') { Faker::Date.backward }
    send('Projected Start Date') { Faker::Date.backward }
    send('Projected Start Time') { Faker::Time.backward }
    send('Projected End Date') { Faker::Date.forward }
    send('Projected End Time') { Faker::Time.forward }
    send('Actual Start Date') { Faker::Date.backward }
    send('Actual Start Time') { Faker::Time.backward }
    send('Actual End Date') { Faker::Date.forward }
    send('Actual End Time') { Faker::Time.forward }
    send('Sickness Start Date') { Faker::Date.backward }
    send('Sickness Date End') { Faker::Date.forward }
    send('Absence Duration Days') { Faker::Number.within(range: 1..20) }
    send('Absence Duration Hours') { Faker::Number.within(range: 20..160) }
    send('Absence Units') { Faker::Number.within(range: 1..20) }
    send('Hours Lost') { Faker::Number.within(range: 1..200) }
    send('Sessions Lost') { Faker::Number.within(range: 1..20) }
    send('Work Related') { Faker::Boolean.boolean }
    send('Third Party') { Faker::Boolean.boolean }
    send('Disability Related') { Faker::Boolean.boolean(true_ratio: 0.2) }
    send('Violence Aggression Related') { Faker::Boolean.boolean(true_ratio: 0.01) }
    send('Notifiable Disease') { Faker::Boolean.boolean(true_ratio: 0.1) }
    send('Return To Work Discussion Date') { Faker::Date.forward }
    send('Occupational Health Referral Date') { Faker::Date.forward }
    send('Last Update Date') { Faker::Time.backward.iso8601 }
    send('Surgery Related') { Faker::Boolean.boolean(true_ratio: 0.1) }
    send('DH Monitoring') { Faker::Boolean.boolean(true_ratio: 0.2) }
    send('Sickness Reason') { Faker::Alphanumeric.alpha(number: 3).upcase }
    send('3rd Party System Reference') { Faker::Number.unique.number }
  end
end
