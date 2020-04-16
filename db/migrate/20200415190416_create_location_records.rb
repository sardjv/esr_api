class CreateLocationRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :location_records do |t|
      t.string 'Record Type'
      t.string 'Location ID'
      t.string 'Location Code'
      t.string 'Location Description'
      t.date 'Inactive Date'
      t.string 'Assignment Address 1st line'
      t.string 'Assignment Address 2nd line'
      t.string 'Assignment Address 3rd line'
      t.string 'Town'
      t.string 'County'
      t.string 'Postcode'
      t.string 'Country'
      t.string 'Telephone'
      t.string 'Fax'
      t.string 'Payslip Delivery Point'
      t.string 'Site Code'
      t.string 'Welsh Location Translation'
      t.string 'Welsh Address Line 1'
      t.string 'Welsh Address Line 2'
      t.string 'Welsh Address Line 3'
      t.string 'Welsh Town Translation'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :location_records, ['Location ID'], unique: true
  end
end

