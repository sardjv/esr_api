class ETL::Destinations::ActiveRecord

  def write(row)
    if (record = existing_record(row))
      record.update(row)
    else
      row = row.merge({ 'created_at' => Time.current, 'updated_at' => Time.current })
      create(row)
    end
  end

  def create(row)
    case row['Record Type']
    when 'ABA' then ::AbsenceRecord.insert_all!([row])
    when 'PRA' then ::PersonRecord.insert_all!([row])
    when 'POA' then ::PositionRecord.insert_all!([row])
    else false
    end
  end

  def existing_record(row)
    case row['Record Type']
    when 'ABA'
      ::AbsenceRecord.find_by(
        'Absence Attendance ID' => row['Absence Attendance ID']
      )
    when 'PRA'
      ::PersonRecord.find_by(
        'Person ID' => row['Person ID'],
        'Effective Start Date' => row['Effective Start Date'],
        'Effective End Date' => row['Effective End Date']
      )
    when 'POA'
      ::PositionRecord.find_by(
        'Position ID' => row['Position ID'],
        'Effective From Date' => row['Effective From Date'],
        'Effective To Date' => row['Effective To Date']
      )
    end
  end
end
