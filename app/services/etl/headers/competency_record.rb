class ETL::Headers::CompetencyRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Competency Element ID',
      'Competency Type',
      'Competency Status',
      'Competency Name',
      'Date From',
      'Date To',
      'Proficiency Level',
      'VPD Code',
      'Certification Date',
      'Certification Method',
      'Next Certification Date',
      'Competence ID',
      'Business Group ID',
      'Job ID',
      'Organisation ID',
      'Position ID',
      'Proficiency Level ID',
      'Proficiency High Level ID',
      'Essential Flag',
      'Records Type',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [
      'Date From',
      'Date To',
      'Certification Date',
      'Next Certification Date'
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
