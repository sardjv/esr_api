class ETL::Headers::SitRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Special Information ID',
      'Effective Start Date',
      'Effective End Date',
      'Information Type',
      'SEGMENT1',
      'SEGMENT2',
      'SEGMENT3',
      'SEGMENT4',
      'SEGMENT5',
      'SEGMENT6',
      'SEGMENT7',
      'SEGMENT8',
      'SEGMENT9',
      'SEGMENT10',
      'SEGMENT11',
      'SEGMENT12',
      'SEGMENT13',
      'SEGMENT14',
      'SEGMENT15',
      'SEGMENT16',
      'SEGMENT17',
      'SEGMENT18',
      'SEGMENT19',
      'SEGMENT20',
      'SEGMENT21',
      'SEGMENT22',
      'SEGMENT23',
      'SEGMENT24',
      'SEGMENT25',
      'SEGMENT26',
      'SEGMENT27',
      'SEGMENT28',
      'SEGMENT29',
      'SEGMENT30',
      'ATTRIBUTE_CATEGORY',
      'ATTRIBUTE1',
      'ATTRIBUTE2',
      'ATTRIBUTE3',
      'ATTRIBUTE4',
      'ATTRIBUTE5',
      'ATTRIBUTE6',
      'ATTRIBUTE7',
      'ATTRIBUTE8',
      'ATTRIBUTE9',
      'ATTRIBUTE10',
      'ATTRIBUTE11',
      'ATTRIBUTE12',
      'ATTRIBUTE13',
      'ATTRIBUTE14',
      'ATTRIBUTE15',
      'ATTRIBUTE16',
      'ATTRIBUTE17',
      'ATTRIBUTE18',
      'ATTRIBUTE19',
      'ATTRIBUTE20',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [
      'Effective Start Date',
      'Effective End Date'
    ].freeze
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
