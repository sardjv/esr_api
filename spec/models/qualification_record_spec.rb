# == Schema Information
#
# Table name: qualification_records
#
#  id                 :bigint           not null, primary key
#  Person ID          :string(255)
#  Qualification ID   :string(255)
#  Qualification Type :string(255)
#  Title              :string(255)
#  Status             :string(255)
#  Grade              :string(255)
#  Awarded Date       :date
#  Start Date         :date
#  End Date           :date
#  Establishment      :string(255)
#  Country            :string(255)
#  Last Update Date   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
describe QualificationRecord, type: :model do
  it { expect(QualificationRecord.new).to be_valid }
end
