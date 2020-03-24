class CreatePersonRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :person_records do |t|
      t.string :PersonID

      t.timestamps
    end
  end
end
