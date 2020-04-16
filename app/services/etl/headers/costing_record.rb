class ETL::Headers::CostingRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Assignment ID',
      'Costing Allocation ID',
      'Effective Start Date',
      'Effective End Date',
      'Entity Code',
      'Charitable Indicator',
      'Cost Centre',
      'Subjective',
      'Analysis 1',
      'Analysis 2',
      'Element Number',
      'Spare Segment',
      'Percentage Split',
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
