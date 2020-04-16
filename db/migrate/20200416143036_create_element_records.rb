class CreateElementRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :element_records do |t|
      t.string 'Person ID'
      t.string 'Element Entry ID'
      t.date 'Effective Start Date'
      t.date 'Effective End Date'
      t.string 'Element Entry Type'
      t.string 'Assignment ID'
      t.string 'Element Type ID'
      t.string 'Element Type Name'
      t.date 'Earned Date'
      t.string 'Entry Value 1'
      t.string 'Entry Value 2'
      t.string 'Entry Value 3'
      t.string 'Entry Value 4'
      t.string 'Entry Value 5'
      t.string 'Entry Value 6'
      t.string 'Entry Value 7'
      t.string 'Entry Value 8'
      t.string 'Entry Value 9'
      t.string 'Entry Value 10'
      t.string 'Entry Value 11'
      t.string 'Entry Value 12'
      t.string 'Entry Value 13'
      t.string 'Entry Value 14'
      t.string 'Entry Value 15'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :element_records, ['Element Entry ID'], unique: true
  end
end

