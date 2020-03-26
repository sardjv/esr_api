class ETL::Transformations::PersonRecord
  def process(row)
    Hash[headers.zip(row)]
  end

  private

  def headers
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
      'Country of Birth',
      'Previous Employer',
      'Previous EmployerType',
      'CSD 3 Months',
      'CSD 12 Months',
      'NHS CRS UUID',
      'System Person Type',
      'User Person Type',
      'Office e-mail address',
      'NHS StartDate',
      'Last UpdateDate',
      'Disability Flag',
      'Ins_Upd_TimeStamp'
    ].freeze
  end
end
