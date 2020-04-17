FactoryBot.define do
  factory :absence_record do
    id { Faker::Number.unique.number }
    send('Person Extra Information ID') { Faker::Number.unique.number }
  end
end
