FactoryBot.define do
  factory :import do
    name { Faker::Company.industry + rand(6).to_s }
  end
end
