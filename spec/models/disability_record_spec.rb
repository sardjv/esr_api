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
describe DisabilityRecord, type: :model do
  it { expect(DisabilityRecord.new).to be_valid }
end
