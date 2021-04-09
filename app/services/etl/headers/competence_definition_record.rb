class ETL::Headers::CompetenceDefinitionRecord
  def self.all
    [
      'Record Type',
      'Competence ID',
      'Competence Name',
      'Description',
      'Date From',
      'Date To',
      'Behavioural Indicator',
      'Certification Required',
      'Rating Scale ID',
      'Evaluation Method',
      'Renewal Period Freq',
      'Renewal Period Units',
      'Competence Cluster',
      'Competence Alias',
      'VPD Code',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [
      'Date From',
      'Date To'
    ].freeze
  end

  def self.delete_headers
    [
      'Record Type',
      'Competence ID'
    ]
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
