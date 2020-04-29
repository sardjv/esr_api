FactoryBot.define do
  factory :person_eit_record, class: 'PersonEitRecord' do
    id { Faker::Number.unique.number }
    send('Person Extra Information ID') { Faker::Number.unique.number }
  end
end
