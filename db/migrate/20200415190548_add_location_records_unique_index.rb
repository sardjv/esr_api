class AddLocationRecordsUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :location_records, ['Location ID'], unique: true
  end
end
