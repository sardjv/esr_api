class CreatePersonRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :person_records do |t|
      t.string 'PersonID'
      t.string 'Record Type'
      t.date 'Effective StartDate'
      t.date 'Effective EndDate'
      t.string 'Employee Number'
      t.string 'Title'
      t.string 'LastName'
      t.string 'FirstName'
      t.string 'MiddleNames'
      t.string 'MaidenName'
      t.string 'PreferredName'
      t.string 'Previous LastName'
      t.string 'Gender'
      t.date 'Date of Birth'
      t.string 'NationalInsurance Number'
      t.string 'NHS UniqueID'
      t.date 'HireDate'
      t.date 'ActualTermination Date'
      t.string 'Termination Reason'
      t.string 'Employee StatusFlag'
      t.string 'WTR Opt Out'
      t.date 'WTR Opt Out Date'
      t.string 'Ethnic Origin'
      t.string 'Country of Birth'
      t.string 'Previous Employer'
      t.string 'Previous EmployerType'
      t.date 'CSD 3 Months'
      t.date 'CSD 12 Months'
      t.string 'NHS CRS UUID'
      t.string 'System Person Type'
      t.string 'User Person Type'
      t.string 'Office e-mail address'
      t.date 'NHS StartDate'
      t.date 'Last UpdateDate'
      t.string 'Disability Flag'

      t.timestamps
    end
  end
end
