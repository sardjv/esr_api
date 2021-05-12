# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  point_of_contact       :boolean          default(FALSE), not null
#  time_zone              :string(255)      default("London"), not null
#
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name  { Faker::Name.unique.last_name }
    email { Faker::Internet.unique.email }
    password { '123password' }
    reset_password_token { Faker::Alphanumeric.unique.alphanumeric(number: 6) }
    point_of_contact { false }

    factory :confirmed_user do
      confirmed_at { Time.current }
    end
  end
end
