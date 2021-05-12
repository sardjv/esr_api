# == Schema Information
#
# Table name: sit_records
#
#  id                     :bigint           not null, primary key
#  Person ID              :string(255)
#  Special Information ID :string(255)
#  Effective Start Date   :date
#  Effective End Date     :date
#  Information Type       :string(255)
#  SEGMENT1               :string(255)
#  SEGMENT2               :string(255)
#  SEGMENT3               :string(255)
#  SEGMENT4               :string(255)
#  SEGMENT5               :string(255)
#  SEGMENT6               :string(255)
#  SEGMENT7               :string(255)
#  SEGMENT8               :string(255)
#  SEGMENT9               :string(255)
#  SEGMENT10              :string(255)
#  SEGMENT11              :string(255)
#  SEGMENT12              :string(255)
#  SEGMENT13              :string(255)
#  SEGMENT14              :string(255)
#  SEGMENT15              :string(255)
#  SEGMENT16              :string(255)
#  SEGMENT17              :string(255)
#  SEGMENT18              :string(255)
#  SEGMENT19              :string(255)
#  SEGMENT20              :string(255)
#  SEGMENT21              :string(255)
#  SEGMENT22              :string(255)
#  SEGMENT23              :string(255)
#  SEGMENT24              :string(255)
#  SEGMENT25              :string(255)
#  SEGMENT26              :string(255)
#  SEGMENT27              :string(255)
#  SEGMENT28              :string(255)
#  SEGMENT29              :string(255)
#  SEGMENT30              :string(255)
#  ATTRIBUTE_CATEGORY     :string(255)
#  ATTRIBUTE1             :string(255)
#  ATTRIBUTE2             :string(255)
#  ATTRIBUTE3             :string(255)
#  ATTRIBUTE4             :string(255)
#  ATTRIBUTE5             :string(255)
#  ATTRIBUTE6             :string(255)
#  ATTRIBUTE7             :string(255)
#  ATTRIBUTE8             :string(255)
#  ATTRIBUTE9             :string(255)
#  ATTRIBUTE10            :string(255)
#  ATTRIBUTE11            :string(255)
#  ATTRIBUTE12            :string(255)
#  ATTRIBUTE13            :string(255)
#  ATTRIBUTE14            :string(255)
#  ATTRIBUTE15            :string(255)
#  ATTRIBUTE16            :string(255)
#  ATTRIBUTE17            :string(255)
#  ATTRIBUTE18            :string(255)
#  ATTRIBUTE19            :string(255)
#  ATTRIBUTE20            :string(255)
#  Last Update Date       :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
describe SitRecord, type: :model do
  it { expect(SitRecord.new).to be_valid }
end
