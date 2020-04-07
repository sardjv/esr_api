class ConvertStringsToDatesForPersonRecords < ActiveRecord::Migration[6.0]
  def change
    change_column :person_records, 'Effective StartDate', :date
    change_column :person_records, 'Effective EndDate', :date
    change_column :person_records, 'Date of Birth', :date
    change_column :person_records, 'HireDate', :date
    change_column :person_records, 'ActualTermination Date', :date
    change_column :person_records, 'WTR Opt Out Date', :date
    change_column :person_records, 'CSD 3 Months', :date
    change_column :person_records, 'CSD 12 Months', :date
    change_column :person_records, 'NHS StartDate', :date
    change_column :person_records, 'Last UpdateDate', :date
    change_column :person_records, 'Ins_Upd_TimeStamp', :timestamp
  end
end
