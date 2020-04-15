class AddPositionRecordsUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :position_records, ['Position ID', 'Effective From Date', 'Effective To Date'], unique: true
  end
end
