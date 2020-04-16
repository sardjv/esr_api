class CreateQualificationRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :qualification_records do |t|
      t.string 'Person ID'
      t.string 'Qualification ID'
      t.string 'Qualification Type'
      t.string 'Title'
      t.string 'Status'
      t.string 'Grade'
      t.date 'Awarded Date'
      t.date 'Start Date'
      t.date 'End Date'
      t.string 'Establishment'
      t.string 'Country'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :qualification_records, ['Qualification ID'], unique: true
  end
end

