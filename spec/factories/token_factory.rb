FactoryBot.define do
  factory :token do
    name { Faker::Company.unique.industry }
    token { '123token' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
