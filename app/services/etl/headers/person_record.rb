class ETL::Headers::PersonRecord
  def self.all
    [
      'Record Type',
      'PersonID',
      'Effective StartDate',
      'Effective EndDate',
      'Employee Number',
      'Title',
      'LastName',
      'FirstName',
      'MiddleNames',
      'MaidenName',
      'PreferredName',
      'Previous LastName',
      'Gender',
      'Date of Birth',
      'NationalInsurance Number',
      'NHS UniqueID',
      'HireDate',
      'ActualTermination Date',
      'Termination Reason',
      'Employee StatusFlag',
      'WTR Opt Out',
      'WTR Opt Out Date',
      'Ethnic Origin',
      'not_used',
      'Country of Birth',
      'Previous Employer',
      'Previous EmployerType',
      'CSD 3 Months',
      'CSD 12 Months',
      'NHS CRS UUID',
      'not_used',
      'not_used',
      'not_used',
      'System Person Type',
      'User Person Type',
      'Office e-mail address',
      'NHS StartDate',
      'not_used',
      'Last UpdateDate',
      'Disability Flag',
      'not_used',
      'not_used',
      'not_used',
      'not_used'
    ].freeze
  end

  def self.date_headers
    [
      'Effective StartDate',
      'Effective EndDate',
      'Date of Birth',
      'HireDate',
      'ActualTermination Date',
      'WTR Opt Out Date',
      'CSD 3 Months',
      'CSD 12 Months',
      'NHS StartDate',
      'Last UpdateDate'
    ].freeze
  end

  def self.timestamp_headers
    [
      'Ins_Upd_TimeStamp'
    ].freeze
  end

  def self.non_blank_headers
    all - ['not_used']
  end
end
