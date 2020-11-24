class ETL::Destinations::ActiveRecord
  attr_reader :filename

  def initialize(filename:)
    @filename = filename
  end

  def write(row, retries = 0)
    set_paper_trail_whodunnit

    if (record = existing_record(row))
      if delete?(row)
        record.destroy
      else
        record.update(row.except('Record Type'))
      end
    else
      row = row.merge({ 'created_at' => Time.current, 'updated_at' => Time.current })
      create(row, retries)
    end
  end

  def create(row, retries)
    begin
      case row['Record Type']
      when 'ABA' then ::AbsenceRecord.create(row.except('Record Type'))
      when 'ASA' then ::AssignmentRecord.create(row.except('Record Type'))
      when 'COA' then ::CostingRecord.create(row.except('Record Type'))
      when 'CMA' then ::CompetencyRecord.create(row.except('Record Type'))
      when 'DTA' then ::DisabilityRecord.create(row.except('Record Type'))
      when 'ELA' then ::ElementRecord.create(row.except('Record Type'))
      when 'ETA' then ::PersonEitRecord.create(row.except('Record Type'))
      when 'LCA' then ::LocationRecord.create(row.except('Record Type'))
      when 'ORA' then ::OrganisationRecord.create(row.except('Record Type'))
      when 'PRA' then ::PersonRecord.create(row.except('Record Type'))
      when 'PIA' then ::PositionEitRecord.create(row.except('Record Type'))
      when 'POA' then ::PositionRecord.create(row.except('Record Type'))
      when 'QLA' then ::QualificationRecord.create(row.except('Record Type'))
      when 'STA' then ::SitRecord.create(row.except('Record Type'))
      when 'TRA' then ::TrainingAbsenceRecord.create(row.except('Record Type'))
      end
    rescue ActiveRecord::RecordNotUnique
      # Race condition where a record is
      # created and updated at almost the same time; the record can be created after
      # the #existing_record check, but before #create is called.
      # In that case, another call to write(row) should be able to find and update the row.
      # Careful about just retrying the job as an alternative - that could lead to a situation
      # where update jobs get in the wrong order (if another one has already been queued
      # for this record in the meantime). Also note that this depends on there only being 1 running
      # worker per job type.
      # If TooManyRetriesError is raised, there's a flaw in my logic, or need to wait for
      # more retries.
      raise TooManyRetriesError if retries >= 100

      retries += 1
      write(row, retries)
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
        'Assignment ID' => row['Assignment ID']
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
        'Position ID' => row['Position ID']
      )
    when 'PRA', 'PRD'
      ::PersonRecord.find_by(
        'Person ID' => row['Person ID']
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

  def set_paper_trail_whodunnit
    PaperTrail.request.controller_info = info_for_paper_trail
  end

  def info_for_paper_trail
    {
      whodunnit_type: 'Import',
      whodunnit: filename_without_path
    }
  end

  def filename_without_path
    filename.split('/').last
  end
end
