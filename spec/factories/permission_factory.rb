FactoryBot.define do
  factory :permission do
    resource { 'absence_records' }
    action { 'index' }
    columns { 'Person ID,Actual Start Date,Actual End Date' }
    subject_type { 'Token' }
    subject_id { create(:token).id }
  end
end
