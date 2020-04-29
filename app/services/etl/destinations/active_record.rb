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
    when 'ASA' then ::AssignmentRecord.insert_all!([row.except('Record Type')])
    when 'COA' then ::CostingRecord.insert_all!([row.except('Record Type')])
    when 'CMA' then ::CompetencyRecord.insert_all!([row.except('Record Type')])
    when 'DTA' then ::DisabilityRecord.insert_all!([row.except('Record Type')])
    when 'ELA' then ::ElementRecord.insert_all!([row.except('Record Type')])
    when 'ETA' then ::PersonEitRecord.insert_all!([row.except('Record Type')])
    when 'LCA' then ::LocationRecord.insert_all!([row.except('Record Type')])
    when 'ORA' then ::OrganisationRecord.insert_all!([row.except('Record Type')])
    when 'PRA' then ::PersonRecord.insert_all!([row.except('Record Type')])
    when 'PIA' then ::PositionEitRecord.insert_all!([row.except('Record Type')])
    when 'POA' then ::PositionRecord.insert_all!([row.except('Record Type')])
    when 'QLA' then ::QualificationRecord.insert_all!([row.except('Record Type')])
    when 'STA' then ::SitRecord.insert_all!([row.except('Record Type')])
    when 'TRA' then ::TrainingAbsenceRecord.insert_all!([row.except('Record Type')])
    end
  end

  def delete?(row)
    %w[
      ABD
      ASD
      COD
      CMD
      DTD
      ELD
      ETD
      LCD
      ORD
      PID
      POD
      PRD
      QLD
      STD
      TRD
    ].include?(row['Record Type'])
  end

  def existing_record(row)
    case row['Record Type']
    when 'ABA', 'ABD'
      ::AbsenceRecord.find_by(
        'Absence Attendance ID' => row['Absence Attendance ID']
      )
    when 'ASA', 'ASD'
      ::AssignmentRecord.find_by(
        'Assignment ID' => row['Assignment ID'],
        'Effective Start Date' => row['Effective Start Date'],
        'Effective End Date' => row['Effective End Date']
      )
    when 'COA', 'COD'
      ::CostingRecord.find_by(
        'Costing Allocation ID' => row['Costing Allocation ID']
      )
    when 'CMA', 'CMD'
      ::CompetencyRecord.find_by(
        'Competency Element ID' => row['Competency Element ID']
      )
    when 'DTA', 'DTD'
      ::DisabilityRecord.find_by(
        'Disability ID' => row['Disability ID']
      )
    when 'ELA', 'ELD'
      ::ElementRecord.find_by(
        'Element Entry ID' => row['Element Entry ID']
      )
    when 'ETA', 'ETD'
      ::PersonEitRecord.find_by(
        'Person Extra Information ID' => row['Person Extra Information ID']
      )
    when 'LCA', 'LCD'
      ::LocationRecord.find_by(
        'Location ID' => row['Location ID']
      )
    when 'ORA', 'ORD'
      ::OrganisationRecord.find_by(
        'Organisation ID' => row['Organisation ID']
      )
    when 'PIA', 'PID'
      ::PositionEitRecord.find_by(
        'Position Extra Information ID' => row['Position Extra Information ID']
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
    when 'QLA', 'QLD'
      ::QualificationRecord.find_by(
        'Qualification ID' => row['Qualification ID']
      )
    when 'STA', 'STD'
      ::SitRecord.find_by(
        'Special Information ID' => row['Special Information ID']
      )
    when 'TRA', 'TRD'
      ::TrainingAbsenceRecord.find_by(
        'Absence Attendance ID' => row['Absence Attendance ID']
      )
    end
  end
end
