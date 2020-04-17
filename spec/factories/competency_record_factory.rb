FactoryBot.define do
  factory :competency_record do
    id { Faker::Number.unique.number }
    send('Competency Element ID') { Faker::Number.unique.number }
  end
end
