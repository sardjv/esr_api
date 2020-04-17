FactoryBot.define do
  factory :assignment_record do
    id { Faker::Number.unique.number }
    send('Assignment ID') { Faker::Number.unique.number }
    send('Effective From Date') { Faker::Date.backward }
    send('Effective To Date') { Faker::Date.forward }
  end
end
