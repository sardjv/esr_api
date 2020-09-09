FactoryBot.define do
  factory :token do
    encrypted_token { '123token' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
