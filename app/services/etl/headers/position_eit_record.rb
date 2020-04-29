class ETL::Headers::PositionEitRecord
  def self.all
    [
      'Record Type',
      'Position ID',
      'Position Extra Information ID',
      'Information Type',
      'POEI_INFORMATION_CATEGORY',
      'POEI_INFORMATION1',
      'POEI_INFORMATION2',
      'POEI_INFORMATION3',
      'POEI_INFORMATION4',
      'POEI_INFORMATION5',
      'POEI_INFORMATION6',
      'POEI_INFORMATION7',
      'POEI_INFORMATION8',
      'POEI_INFORMATION9',
      'POEI_INFORMATION10',
      'POEI_INFORMATION11',
      'POEI_INFORMATION12',
      'POEI_INFORMATION13',
      'POEI_INFORMATION14',
      'POEI_INFORMATION15',
      'POEI_INFORMATION16',
      'POEI_INFORMATION17',
      'POEI_INFORMATION18',
      'POEI_INFORMATION19',
      'POEI_INFORMATION20',
      'POEI_INFORMATION21',
      'POEI_INFORMATION22',
      'POEI_INFORMATION23',
      'POEI_INFORMATION24',
      'POEI_INFORMATION25',
      'POEI_INFORMATION26',
      'POEI_INFORMATION27',
      'POEI_INFORMATION28',
      'POEI_INFORMATION29',
      'POEI_INFORMATION30',
      'ATTRIBUTE_CATEGORY',
      'POEI_ATTRIBUTE1',
      'POEI_ATTRIBUTE2',
      'POEI_ATTRIBUTE3',
      'POEI_ATTRIBUTE4',
      'POEI_ATTRIBUTE5',
      'POEI_ATTRIBUTE6',
      'POEI_ATTRIBUTE7',
      'POEI_ATTRIBUTE8',
      'POEI_ATTRIBUTE9',
      'POEI_ATTRIBUTE10',
      'POEI_ATTRIBUTE11',
      'POEI_ATTRIBUTE12',
      'POEI_ATTRIBUTE13',
      'POEI_ATTRIBUTE14',
      'POEI_ATTRIBUTE15',
      'POEI_ATTRIBUTE16',
      'POEI_ATTRIBUTE17',
      'POEI_ATTRIBUTE18',
      'POEI_ATTRIBUTE19',
      'POEI_ATTRIBUTE20',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [].freeze
  end

  def self.timestamp_headers
    [
      'Last Update Date'
    ].freeze
  end

  def self.non_blank_headers
    all - ['not_used']
  end

  def self.api_headers
    non_blank_headers - ['Record Type']
  end
end
