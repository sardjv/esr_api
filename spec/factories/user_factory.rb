FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name  { Faker::Name.unique.last_name }
    email { Faker::Internet.unique.email }
    password { '123password' }
    reset_password_token { Faker::Alphanumeric.unique.alphanumeric(number: 6) }

    factory :confirmed_user do
      confirmed_at { Time.current }
    end
  end
end
