class CreateDisabilityRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :disability_records do |t|
      t.string 'Person ID'
      t.string 'Disability ID'
      t.string 'Category'
      t.string 'Status'

      t.timestamps
    end

    add_index :disability_records, ['Disability ID'], unique: true
  end
end

