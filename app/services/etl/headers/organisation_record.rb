class ETL::Headers::OrganisationRecord
  def self.all
    [
      'Record Type',
      'Organisation ID',
      'Organisation Name',
      'Organisation Type',
      'Effective From Date',
      'Effective To Date',
      'Hierarchy Version ID',
      'Hierarchy Version Date From',
      'Hierarchy Version Date To',
      'Default Cost Centre',
      'Parent Organisation ID',
      'NACS Code',
      'Location ID',
      'Last Update Date',
      'Cost Centre Description'
    ].freeze
  end

  def self.date_headers
    [
      'Effective From Date',
      'Effective To Date',
      'Hierarchy Version Date From',
      'Hierarchy Version Date To'
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
