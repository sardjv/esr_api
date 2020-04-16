class ETL::Headers::QualificationRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Qualification ID',
      'Qualification Type',
      'Title',
      'Status',
      'Grade',
      'Awarded Date',
      'Start Date',
      'End Date',
      'Establishment',
      'Country',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [
      'Awarded Date',
      'Start Date',
      'End Date'
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
