class CreatePersonRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :person_records do |t|
      t.string 'Person ID'
      t.date 'Effective Start Date'
      t.date 'Effective End Date'
      t.string 'Employee Number'
      t.string 'Title'
      t.string 'Last Name'
      t.string 'First Name'
      t.string 'Middle Names'
      t.string 'Maiden Name'
      t.string 'Preferred Name'
      t.string 'Previous Last Name'
      t.string 'Gender'
      t.date 'Date of Birth'
      t.string 'National Insurance Number'
      t.string 'NHS Unique ID'
      t.date 'Hire Date'
      t.date 'Actual Termination Date'
      t.string 'Termination Reason'
      t.string 'Employee Status Flag'
      t.string 'WTR Opt Out'
      t.date 'WTR Opt Out Date'
      t.string 'Ethnic Origin'
      t.string 'Country of Birth'
      t.string 'Previous Employer'
      t.string 'Previous Employer Type'
      t.date 'CSD 3 Months'
      t.date 'CSD 12 Months'
      t.string 'NHS CRS UUID'
      t.string 'System Person Type'
      t.string 'User Person Type'
      t.string 'Office E-mail Address'
      t.date 'NHS Start Date'
      t.date 'Last Update Date'
      t.string 'Disability Flag'

      t.timestamps
    end

    add_index :person_records, ['Person ID', 'Effective Start Date', 'Effective End Date'], unique: true, name: 'index_person_records_effective_start_and_end'
  end
end
