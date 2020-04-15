FactoryBot.define do
  factory :position_record do
    id { Faker::Number.unique.number }
    send('Position ID') { Faker::Number.unique.number }
    send('Effective From Date') { Faker::Date.backward }
    send('Effective To Date') { Faker::Date.forward }
  end
end
