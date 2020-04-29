class ETL::Headers::PersonEitRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Person Extra Information ID',
      'Information Type',
      'PEI_INFORMATION_CATEGORY',
      'PEI_INFORMATION1',
      'PEI_INFORMATION2',
      'PEI_INFORMATION3',
      'PEI_INFORMATION4',
      'PEI_INFORMATION5',
      'PEI_INFORMATION6',
      'PEI_INFORMATION7',
      'PEI_INFORMATION8',
      'PEI_INFORMATION9',
      'PEI_INFORMATION10',
      'PEI_INFORMATION11',
      'PEI_INFORMATION12',
      'PEI_INFORMATION13',
      'PEI_INFORMATION14',
      'PEI_INFORMATION15',
      'PEI_INFORMATION16',
      'PEI_INFORMATION17',
      'PEI_INFORMATION18',
      'PEI_INFORMATION19',
      'PEI_INFORMATION20',
      'PEI_INFORMATION21',
      'PEI_INFORMATION22',
      'PEI_INFORMATION23',
      'PEI_INFORMATION24',
      'PEI_INFORMATION25',
      'PEI_INFORMATION26',
      'PEI_INFORMATION27',
      'PEI_INFORMATION28',
      'PEI_INFORMATION29',
      'PEI_INFORMATION30',
      'ATTRIBUTE_CATEGORY',
      'PEI_ATTRIBUTE1',
      'PEI_ATTRIBUTE2',
      'PEI_ATTRIBUTE3',
      'PEI_ATTRIBUTE4',
      'PEI_ATTRIBUTE5',
      'PEI_ATTRIBUTE6',
      'PEI_ATTRIBUTE7',
      'PEI_ATTRIBUTE8',
      'PEI_ATTRIBUTE9',
      'PEI_ATTRIBUTE10',
      'PEI_ATTRIBUTE11',
      'PEI_ATTRIBUTE12',
      'PEI_ATTRIBUTE13',
      'PEI_ATTRIBUTE14',
      'PEI_ATTRIBUTE15',
      'PEI_ATTRIBUTE16',
      'PEI_ATTRIBUTE17',
      'PEI_ATTRIBUTE18',
      'PEI_ATTRIBUTE19',
      'PEI_ATTRIBUTE20',
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
