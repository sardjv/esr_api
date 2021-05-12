# == Schema Information
#
# Table name: ftp_credentials
#
#  id                                         :bigint           not null, primary key
#  name                                       :string(255)      not null
#  host_ciphertext                            :string(255)      not null
#  user_ciphertext                            :string(255)      not null
#  password_ciphertext                        :string(255)      not null
#  created_by_id                              :bigint
#  created_at                                 :datetime         not null
#  updated_at                                 :datetime         not null
#  virtual_private_database_number_ciphertext :string(255)      not null
#
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
