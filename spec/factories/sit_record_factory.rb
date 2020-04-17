FactoryBot.define do
  factory :sit_record do
    id { Faker::Number.unique.number }
    send('Special Information ID') { Faker::Number.unique.number }
  end
end
