class ETL::Destinations::ActiveRecord

  def write(row)
    if (record = existing_record(row))
      if delete?(row)
        record.destroy
      else
        record.update(row.except('Record Type'))
      end
    else
      row = row.merge({ 'created_at' => Time.current, 'updated_at' => Time.current })
      create(row)
    end
  end

  def create(row)
    case row['Record Type']
    when 'ABA' then ::AbsenceRecord.insert_all!([row.except('Record Type')])
    when 'LCA' then ::LocationRecord.insert_all!([row.except('Record Type')])
    when 'PRA' then ::PersonRecord.insert_all!([row.except('Record Type')])
    when 'POA' then ::PositionRecord.insert_all!([row.except('Record Type')])
    end
  end

  def delete?(row)
    %w[
      ABD
      LCD
      POD
      PRD
    ].include?(row['Record Type'])
  end

  def existing_record(row)
    case row['Record Type']
    when 'ABA', 'ADB'
      ::AbsenceRecord.find_by(
        'Absence Attendance ID' => row['Absence Attendance ID']
      )
    when 'LCA', 'LCD'
      ::LocationRecord.find_by(
        'Location ID' => row['Location ID']
      )
    when 'POA', 'POD'
      ::PositionRecord.find_by(
        'Position ID' => row['Position ID'],
        'Effective From Date' => row['Effective From Date'],
        'Effective To Date' => row['Effective To Date']
      )
    when 'PRA', 'PRD'
      ::PersonRecord.find_by(
        'Person ID' => row['Person ID'],
        'Effective Start Date' => row['Effective Start Date'],
        'Effective End Date' => row['Effective End Date']
      )
    end
  end
end
