FactoryBot.define do
  factory :ftp_credential do
    name { Faker::Company.industry + rand(6).to_s }
    host { 'private.ftp-servers.example.com' }
    port { '1234' }
    user { 'user001' }
    password { 'secretpassword' }
    path { 'mydirectory' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
