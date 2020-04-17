FactoryBot.define do
  factory :absence_record do
    id { Faker::Number.unique.number }
    send('Qualification ID') { Faker::Number.unique.number }
  end
end
