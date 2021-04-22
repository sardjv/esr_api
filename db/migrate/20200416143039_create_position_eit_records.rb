class CreatePositionEitRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :position_eit_records do |t|
      t.string 'Position ID'
      t.string 'Position Extra Information ID'
      t.string 'Information Type'
      t.string 'POEI_INFORMATION_CATEGORY'
      t.string 'POEI_INFORMATION1'
      t.string 'POEI_INFORMATION2'
      t.string 'POEI_INFORMATION3'
      t.string 'POEI_INFORMATION4'
      t.string 'POEI_INFORMATION5'
      t.string 'POEI_INFORMATION6'
      t.string 'POEI_INFORMATION7'
      t.string 'POEI_INFORMATION8'
      t.string 'POEI_INFORMATION9'
      t.string 'POEI_INFORMATION10'
      t.string 'POEI_INFORMATION11'
      t.string 'POEI_INFORMATION12'
      t.string 'POEI_INFORMATION13'
      t.string 'POEI_INFORMATION14'
      t.string 'POEI_INFORMATION15'
      t.string 'POEI_INFORMATION16'
      t.string 'POEI_INFORMATION17'
      t.string 'POEI_INFORMATION18'
      t.string 'POEI_INFORMATION19'
      t.string 'POEI_INFORMATION20'
      t.string 'POEI_INFORMATION21'
      t.string 'POEI_INFORMATION22'
      t.string 'POEI_INFORMATION23'
      t.string 'POEI_INFORMATION24'
      t.string 'POEI_INFORMATION25'
      t.string 'POEI_INFORMATION26'
      t.string 'POEI_INFORMATION27'
      t.string 'POEI_INFORMATION28'
      t.string 'POEI_INFORMATION29'
      t.string 'POEI_INFORMATION30'
      t.string 'ATTRIBUTE_CATEGORY'
      t.string 'POEI_ATTRIBUTE1'
      t.string 'POEI_ATTRIBUTE2'
      t.string 'POEI_ATTRIBUTE3'
      t.string 'POEI_ATTRIBUTE4'
      t.string 'POEI_ATTRIBUTE5'
      t.string 'POEI_ATTRIBUTE6'
      t.string 'POEI_ATTRIBUTE7'
      t.string 'POEI_ATTRIBUTE8'
      t.string 'POEI_ATTRIBUTE9'
      t.string 'POEI_ATTRIBUTE10'
      t.string 'POEI_ATTRIBUTE11'
      t.string 'POEI_ATTRIBUTE12'
      t.string 'POEI_ATTRIBUTE13'
      t.string 'POEI_ATTRIBUTE14'
      t.string 'POEI_ATTRIBUTE15'
      t.string 'POEI_ATTRIBUTE16'
      t.string 'POEI_ATTRIBUTE17'
      t.string 'POEI_ATTRIBUTE18'
      t.string 'POEI_ATTRIBUTE19'
      t.string 'POEI_ATTRIBUTE20'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :position_eit_records, ['Position Extra Information ID'], unique: true
  end
end
