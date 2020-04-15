class AddPersonRecordsUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :person_records, ['Person ID', 'Effective Start Date', 'Effective End Date'], unique: true
  end
end
