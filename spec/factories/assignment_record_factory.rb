FactoryBot.define do
  factory :assignment_record do
    id { Faker::Number.unique.number }
    send('Assignment ID') { Faker::Number.unique.number }
    send('Effective Start Date') { Faker::Date.backward }
    send('Effective End Date') { Faker::Date.forward }
  end
end
