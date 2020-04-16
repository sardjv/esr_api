class ETL::Headers::DisabilityRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Disability ID',
      'not_used',
      'not_used',
      'not_used',
      'Category',
      'Status',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
    ].freeze
  end

  def self.date_headers
    [].freeze
  end

  def self.timestamp_headers
    [].freeze
  end

  def self.non_blank_headers
    all - ['not_used']
  end

  def self.api_headers
    non_blank_headers - ['Record Type']
  end
end
