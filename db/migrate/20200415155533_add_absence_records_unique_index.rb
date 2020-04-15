class AddAbsenceRecordsUniqueIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :absence_records, ['Absence Attendance ID'], unique: true
  end
end
