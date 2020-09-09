FactoryBot.define do
  factory :token do
    name { 'Token for Javascript SPA' }
    token { '123token' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
