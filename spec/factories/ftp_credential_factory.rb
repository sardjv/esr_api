FactoryBot.define do
  factory :ftp_credential do
    name { Faker::Company.industry + rand(6).to_s }
    host { 'test_ftp' }
    port { '21' }
    user { 'user' }
    password { 'password' }
    path { 'mydirectory' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
