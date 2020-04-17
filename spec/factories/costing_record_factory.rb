FactoryBot.define do
  factory :costing_record do
    id { Faker::Number.unique.number }
    send('Costing Allocation ID') { Faker::Number.unique.number }
  end
end
