class CreateAbsenceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :absence_records do |t|
      t.string 'Person ID'
      t.string 'Absence Attendance ID'
      t.string 'Absence Type'
      t.string 'Absence Reason'
      t.string 'Status'
      t.date 'Notification Date'
      t.date 'Projected Start Date'
      t.string 'Projected Start Time'
      t.date 'Projected End Date'
      t.string 'Projected End Time'
      t.date 'Actual Start Date'
      t.string 'Actual Start Time'
      t.date 'Actual End Date'
      t.string 'Actual End Time'
      t.date 'Sickness Start Date'
      t.date 'Sickness Date End'
      t.string 'Absence Duration Days'
      t.string 'Absence Duration Hours'
      t.string 'Absence Units'
      t.string 'Hours Lost'
      t.string 'Sessions Lost'
      t.string 'Work Related'
      t.string 'Third Party'
      t.string 'Disability Related'
      t.string 'Violence Aggression Related'
      t.string 'Notifiable Disease'
      t.date 'Return To Work Discussion Date'
      t.date 'Occupational Health Referral Date'
      t.timestamp 'Last Update Date'
      t.string 'Surgery Related'
      t.string 'DH Monitoring'
      t.string 'Sickness Reason'
      t.string '3rd Party System Reference'

      t.timestamps
    end

    add_index :absence_records, ['Absence Attendance ID'], unique: true
  end
end
