class CreateAbsenceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :absence_records do |t|
      t.string 'Record Type'
      t.string 'PersonID'
      t.string 'Absence AttendanceID'
      t.string 'Absence Type'
      t.string 'Absence Reason'
      t.string 'Status'
      t.date 'Notification Date'
      t.date 'Projected StartDate'
      t.string 'Projected StartTime'
      t.date 'Projected EndDate'
      t.string 'Projected EndTime'
      t.date 'Actual StartDate'
      t.string 'Actual StartTime'
      t.date 'Actual EndDate'
      t.string 'Actual EndTime'
      t.date 'Sickness StartDate'
      t.date 'Sickness DateEnd'
      t.string 'Absence Duration Days'
      t.string 'Absence Duration Hours'
      t.string 'Absence Units'
      t.string 'Hours Lost'
      t.string 'Sessions Lost'
      t.string 'Work Related'
      t.string 'Third Party'
      t.string 'Disability Related'
      t.string 'Violence AggressionRelated'
      t.string 'Notifyable Disease'
      t.date 'Returntowork discussiondate'
      t.date 'OccupationalHealth referralDate'
      t.timestamp 'Last UpdateDate'
      t.string 'Surgery Related'
      t.string 'DH Monitoring'
      t.string 'Sickness Reason'
      t.string '3rdParty SystemReference'

      t.timestamps
    end
  end
end
