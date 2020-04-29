FactoryBot.define do
  factory :position_eit_record, class: 'PositionEitRecord' do
    id { Faker::Number.unique.number }
    send('Position Extra Information ID') { Faker::Number.unique.number }
  end
end
