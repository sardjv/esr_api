FactoryBot.define do
  factory :position_record do
    id { Faker::Number.unique.number }
  end
end
