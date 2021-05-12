# == Schema Information
#
# Table name: disability_records
#
#  id            :bigint           not null, primary key
#  Person ID     :string(255)
#  Disability ID :string(255)
#  Category      :string(255)
#  Status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :disability_record do
    id { Faker::Number.unique.number }
    send('Disability ID') { Faker::Number.unique.number }
  end
end
