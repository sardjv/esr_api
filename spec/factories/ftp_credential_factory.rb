FactoryBot.define do
  factory :ftp_credential do
    name { Faker::Company.industry + rand(6).to_s }
    host { 'test_ftp' }
    user { 'user' }
    password { 'password' }
    virtual_private_database_number { '123' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
