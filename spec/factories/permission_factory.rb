# == Schema Information
#
# Table name: permissions
#
#  id           :bigint           not null, primary key
#  subject_type :string(255)
#  subject_id   :bigint
#  resource     :string(255)      not null
#  action       :string(255)      not null
#  columns      :text(65535)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :permission do
    resource { Permission::RESOURCES.first }
    action { Permission::ACTIONS.first }
    columns { 'Person ID,Actual Start Date,Actual End Date' }
  end
end
