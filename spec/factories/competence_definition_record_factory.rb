FactoryBot.define do
  factory :competence_definition_record do
    id { Faker::Number.unique.number }
    send('Competence ID') { Faker::Number.unique.number }
  end
end
