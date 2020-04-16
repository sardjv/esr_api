class CreateAssignmentRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_records do |t|
      t.string 'Person ID'
      t.string 'Assignment ID'
      t.date 'Effective Start Date'
      t.date 'Effective End Date'
      t.date 'Earliest Assignment Start Date'
      t.string 'Assignment Type'
      t.string 'Assignment Number'
      t.string 'System Assignment Status'
      t.string 'User Assignment Status'
      t.string 'Employee Status Flag'
      t.string 'Payroll Name'
      t.string 'Payroll Period Type'
      t.string 'Assignment Location ID'
      t.string 'Supervisor Flag'
      t.string 'Supervisor Person ID'
      t.string 'Supervisor Assignment ID'
      t.string 'Supervisor Assignment Number'
      t.string 'Department Manager Person ID'
      t.string 'Employee Category'
      t.string 'Assignment Category'
      t.string 'Primary Assignment'
      t.string 'Normal Hours / Sessions'
      t.string 'Frequency'
      t.string 'Grade Contract Hours'
      t.string 'FTE'
      t.string 'Flexible Working Pattern'
      t.string 'Organisation ID'
      t.string 'Position ID'
      t.string 'Position Name'
      t.string 'Grade'
      t.string 'Grade Step'
      t.date 'Start Date in Grade'
      t.string 'Annual Salary Value'
      t.string 'Job Name'
      t.string 'People Group'
      t.string 'T&A Flag'
      t.string 'Assignment Night Worker Attribute'
      t.date 'Projected Hire Date'
      t.string 'Vacancy ID'
      t.date 'Contract End Date'
      t.date 'Increment Date'
      t.string 'Maximum Part Time Flag'
      t.string 'AFC Flag'
      t.timestamp 'Last Update Date'
      t.date 'Last Working Day'
      t.string 'e-KSF Spinal Point'
      t.string 'Manager Flag'
      t.date 'Assignment End Date'

      t.timestamps
    end

    add_index :assignment_records, ['Assignment ID', 'Effective Start Date', 'Effective End Date'], unique: true
  end
end

