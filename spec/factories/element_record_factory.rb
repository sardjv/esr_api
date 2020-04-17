FactoryBot.define do
  factory :element_record do
    id { Faker::Number.unique.number }
    send('Element Entry ID') { Faker::Number.unique.number }
  end
end
