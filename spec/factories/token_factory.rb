FactoryBot.define do
  factory :token do
    name { Faker::Company.industry + rand(6).to_s }
    token { '123token' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
    permissions { build_list(:permission, 1) }
  end
end
