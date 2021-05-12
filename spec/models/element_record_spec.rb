# == Schema Information
#
# Table name: element_records
#
#  id                   :bigint           not null, primary key
#  Person ID            :string(255)
#  Element Entry ID     :string(255)
#  Effective Start Date :date
#  Effective End Date   :date
#  Element Entry Type   :string(255)
#  Assignment ID        :string(255)
#  Element Type ID      :string(255)
#  Element Type Name    :string(255)
#  Earned Date          :date
#  Entry Value 1        :string(255)
#  Entry Value 2        :string(255)
#  Entry Value 3        :string(255)
#  Entry Value 4        :string(255)
#  Entry Value 5        :string(255)
#  Entry Value 6        :string(255)
#  Entry Value 7        :string(255)
#  Entry Value 8        :string(255)
#  Entry Value 9        :string(255)
#  Entry Value 10       :string(255)
#  Entry Value 11       :string(255)
#  Entry Value 12       :string(255)
#  Entry Value 13       :string(255)
#  Entry Value 14       :string(255)
#  Entry Value 15       :string(255)
#  Last Update Date     :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
describe ElementRecord, type: :model do
  it { expect(ElementRecord.new).to be_valid }
end
