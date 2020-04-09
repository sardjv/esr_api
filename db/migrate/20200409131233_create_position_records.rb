class CreatePositionRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :position_records do |t|
      t.string 'Record Type'
      t.string 'PositionID'
      t.date 'Effective FromDate'
      t.date 'Effective ToDate'
      t.string 'Position Number'
      t.string 'Position Name'
      t.string 'Budgeted FTE'
      t.string 'Subjective Code'
      t.string 'Job StaffGroup'
      t.string 'Job Role'
      t.string 'Occupation Code'
      t.string 'Payscale'
      t.string 'Grade Step'
      t.string 'ISA Regulated Post'
      t.string 'Organisation ID'
      t.string 'Hiring Status'
      t.string 'Position Type'
      t.string 'Workplace OrgCode'
      t.timestamp 'Last UpdateDate'
      t.string 'Subjective CodeDescription'
      t.timestamp 'Ins_Upd_TimeStamp'

      t.timestamps
    end
  end
end
