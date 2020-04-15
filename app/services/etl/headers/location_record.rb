class ETL::Headers::LocationRecord
  def self.all
    [
      'Record Type',
      'Location ID',
      'Location Code',
      'Location Description',
      'Inactive Date',
      'Assignment Address 1st line',
      'Assignment Address 2nd line',
      'Assignment Address 3rd line',
      'Town',
      'County',
      'Postcode',
      'Country',
      'Telephone',
      'Fax',
      'Payslip Delivery Point',
      'Site Code',
      'Welsh Location Translation',
      'Welsh Address Line 1',
      'Welsh Address Line 2',
      'Welsh Address Line 3',
      'Welsh Town Translation',
      'Last Update Date'
    ].freeze
  end

  def self.date_headers
    [
      'Inactive Date'
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
