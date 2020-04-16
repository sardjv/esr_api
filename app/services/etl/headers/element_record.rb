class ETL::Headers::ElementRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Element Entry ID',
      'Effective Start Date',
      'Effective End Date',
      'Element Entry Type',
      'Assignment ID',
      'Element Type ID',
      'Element Type Name',
      'Earned Date',
      'Entry Value 1',
      'Entry Value 2',
      'Entry Value 3',
      'Entry Value 4',
      'Entry Value 5',
      'Entry Value 6',
      'Entry Value 7',
      'Entry Value 8',
      'Entry Value 9',
      'Entry Value 10',
      'Entry Value 11',
      'Entry Value 12',
      'Entry Value 13',
      'Entry Value 14',
      'Entry Value 15',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [
      'Effective Start Date',
      'Effective End Date',
      'Earned Date'
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
