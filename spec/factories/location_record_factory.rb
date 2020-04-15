FactoryBot.define do
  factory :location_record do
    id { Faker::Number.unique.number }
    send('Location ID') { Faker::Number.unique.number }
  end
end
