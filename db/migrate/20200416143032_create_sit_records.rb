class CreateSITRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :sit_records do |t|
      t.string 'Record Type'
      t.string 'Person ID'
      t.string 'Special Information ID'
      t.date 'Effective Start Date'
      t.date 'Effective End Date'
      t.string 'Information Type'
      t.string 'SEGMENT1'
      t.string 'SEGMENT2'
      t.string 'SEGMENT3'
      t.string 'SEGMENT4'
      t.string 'SEGMENT5'
      t.string 'SEGMENT6'
      t.string 'SEGMENT7'
      t.string 'SEGMENT8'
      t.string 'SEGMENT9'
      t.string 'SEGMENT10'
      t.string 'SEGMENT11'
      t.string 'SEGMENT12'
      t.string 'SEGMENT13'
      t.string 'SEGMENT14'
      t.string 'SEGMENT15'
      t.string 'SEGMENT16'
      t.string 'SEGMENT17'
      t.string 'SEGMENT18'
      t.string 'SEGMENT19'
      t.string 'SEGMENT20'
      t.string 'SEGMENT21'
      t.string 'SEGMENT22'
      t.string 'SEGMENT23'
      t.string 'SEGMENT24'
      t.string 'SEGMENT25'
      t.string 'SEGMENT26'
      t.string 'SEGMENT27'
      t.string 'SEGMENT28'
      t.string 'SEGMENT29'
      t.string 'SEGMENT30'
      t.string 'ATTRIBUTE_CATEGORY'
      t.string 'ATTRIBUTE1'
      t.string 'ATTRIBUTE2'
      t.string 'ATTRIBUTE3'
      t.string 'ATTRIBUTE4'
      t.string 'ATTRIBUTE5'
      t.string 'ATTRIBUTE6'
      t.string 'ATTRIBUTE7'
      t.string 'ATTRIBUTE8'
      t.string 'ATTRIBUTE9'
      t.string 'ATTRIBUTE10'
      t.string 'ATTRIBUTE11'
      t.string 'ATTRIBUTE12'
      t.string 'ATTRIBUTE13'
      t.string 'ATTRIBUTE14'
      t.string 'ATTRIBUTE15'
      t.string 'ATTRIBUTE16'
      t.string 'ATTRIBUTE17'
      t.string 'ATTRIBUTE18'
      t.string 'ATTRIBUTE19'
      t.string 'ATTRIBUTE20'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :sit_records, ['Special Information ID'], unique: true
  end
end
