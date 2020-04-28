class CreatePositionRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :position_records do |t|
      t.string 'Position ID'
      t.date 'Effective From Date'
      t.date 'Effective To Date'
      t.string 'Position Number'
      t.string 'Position Name'
      t.string 'Budgeted FTE'
      t.string 'Subjective Code'
      t.string 'Job Staff Group'
      t.string 'Job Role'
      t.string 'Occupation Code'
      t.string 'Payscale'
      t.string 'Grade Step'
      t.string 'ISA Regulated Post'
      t.string 'Organisation ID'
      t.string 'Hiring Status'
      t.string 'Position Type'
      t.string 'Workplace Org Code'
      t.timestamp 'Last Update Date'
      t.string 'Subjective Code Description'

      t.timestamps
    end

    add_index :position_records, ['Position ID', 'Effective From Date', 'Effective To Date'], unique: true, name: 'index_position_records_effective_from_and_to'
  end
end
