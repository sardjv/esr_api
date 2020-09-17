FactoryBot.define do
  factory :permission do
    resource { Permission::RESOURCES.first }
    action { Permission::ACTIONS.first }
    columns { 'Person ID,Actual Start Date,Actual End Date' }
    subject_type { 'Token' }
    subject_id { Token.all.sample.try(:id) || create(:token).id }
  end
end
