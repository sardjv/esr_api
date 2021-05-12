# == Schema Information
#
# Table name: tokens
#
#  id               :bigint           not null, primary key
#  name             :string(255)      not null
#  token_ciphertext :string(255)      not null
#  token_viewed_at  :datetime
#  created_by_id    :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token_bidx       :string(255)
#
FactoryBot.define do
  factory :token do
    name { Faker::Company.industry + rand(6).to_s }
    token { '123token' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
    permissions { build_list(:permission, 1) }
  end
end
