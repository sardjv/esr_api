FactoryBot.define do
  factory :absence_record do
    id { Faker::Number.unique.number }
    send('Absence Attendance ID') { Faker::Number.unique.number }
  end
end
