FactoryBot.define do
  factory :source do
    name { Faker::Company.industry + rand(6).to_s }
    source { 'ftp://user001:secretpassword@private.ftp-servers.example.com/mydirectory/myfile.txt' }
    created_by_id { User.all.sample.try(:id) || create(:user).id }
  end
end
