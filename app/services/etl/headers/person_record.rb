class ETL::Headers::PersonRecord
  def self.all
    [
      'Record Type',
      'Person ID',
      'Effective Start Date',
      'Effective End Date',
      'Employee Number',
      'Title',
      'Last Name',
      'First Name',
      'Middle Names',
      'Maiden Name',
      'Preferred Name',
      'Previous Last Name',
      'Gender',
      'Date of Birth',
      'National Insurance Number',
      'NHS Unique ID',
      'Hire Date',
      'Actual Termination Date',
      'Termination Reason',
      'Employee Status Flag',
      'WTR Opt Out',
      'WTR Opt Out Date',
      'Ethnic Origin',
      'not_used',
      'Country of Birth',
      'Previous Employer',
      'Previous Employer Type',
      'CSD 3 Months',
      'CSD 12 Months',
      'NHS CRS UUID',
      'not_used',
      'not_used',
      'not_used',
      'System Person Type',
      'User Person Type',
      'Office E-mail Address',
      'NHS Start Date',
      'not_used',
      'Last Update Date',
      'Disability Flag',
      'not_used',
      'not_used',
      'not_used',
      'not_used'
    ].freeze
  end

  def self.date_headers
    [
      'Effective Start Date',
      'Effective End Date',
      'Date of Birth',
      'Hire Date',
      'Actual Termination Date',
      'WTR Opt Out Date',
      'CSD 3 Months',
      'CSD 12 Months',
      'NHS Start Date',
      'Last Update Date'
    ].freeze
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
