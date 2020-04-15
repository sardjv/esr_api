FactoryBot.define do
  factory :person_record do
    id { Faker::Number.unique.number }
    send('Person ID') { Faker::Number.unique.number }
    send('Effective Start Date') { Faker::Date.backward }
    send('Effective End Date') { Faker::Date.forward }
  end
end
