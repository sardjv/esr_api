class ETL::Headers::PositionRecord
  def self.all
    [
      'Record Type',
      'Position ID',
      'Effective From Date',
      'Effective To Date',
      'Position Number',
      'Position Name',
      'Budgeted FTE',
      'Subjective Code',
      'Job Staff Group',
      'Job Role',
      'Occupation Code',
      'Payscale',
      'Grade Step',
      'ISA Regulated Post',
      'Organisation ID',
      'Hiring Status',
      'Position Type',
      'not_used',
      'not_used',
      'not_used',
      'not_used',
      'Workplace Org Code',
      'Last Update Date',
      'Subjective Code Description'
    ].freeze
  end

  def self.date_headers
    [
      'Effective From Date',
      'Effective To Date'
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
