FactoryBot.define do
  factory :permission do
    resource { Permission::RESOURCES.first }
    action { Permission::ACTIONS.first }
    columns { 'Person ID,Actual Start Date,Actual End Date' }
  end
end
