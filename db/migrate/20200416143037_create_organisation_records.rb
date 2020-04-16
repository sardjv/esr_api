class CreateOrganisationRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :organisation_records do |t|
      t.string 'Organisation ID'
      t.string 'Organisation Name'
      t.string 'Organisation Type'
      t.date 'Effective From Date'
      t.date 'Effective To Date'
      t.string 'Hierarchy Version ID'
      t.date 'Hierarchy Version Date From'
      t.date 'Hierarchy Version Date To'
      t.string 'Default Cost Centre'
      t.string 'Parent Organisation ID'
      t.string 'NACS Code'
      t.string 'Location ID'
      t.timestamp 'Last Update Date'
      t.string 'Cost Centre Description'

      t.timestamps
    end

    add_index :organisation_records, ['Organisation ID'], unique: true
  end
end

