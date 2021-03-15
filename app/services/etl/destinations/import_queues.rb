class ETL::Destinations::ImportQueues
  # args are { row: [], filename: "" }
  def write(args)
    # Get the appropriate queue for this row, and send it the job.
    queue_name(args[:row].first).send(:perform_later, row: args[:row], filename: args[:filename])
  end

  private

  def queue_name(type)
    case type
    when 'ABA', 'ABD' then ImportAbsenceRecordJob
    when 'ASA', 'ASD' then ImportAssignmentRecordJob
    when 'COA', 'COD' then ImportCostingRecordJob
    when 'CMA', 'CMD' then ImportCompetencyRecordJob
    when 'DTA', 'DTD' then ImportDisabilityRecordJob
    when 'ELA', 'ELD' then ImportElementRecordJob
    when 'ETA', 'ETD' then ImportPersonEitRecordJob
    when 'LCA', 'LCD' then ImportLocationRecordJob
    when 'ORA', 'ORD' then ImportOrganisationRecordJob
    when 'PRA', 'PRD' then ImportPersonRecordJob
    when 'PIA', 'PID' then ImportPositionEitRecordJob
    when 'POA', 'POD' then ImportPositionRecordJob
    when 'QLA', 'QLD' then ImportQualificationRecordJob
    when 'STA', 'STD' then ImportSitRecordJob
    when 'TRA', 'TRD' then ImportTrainingAbsenceRecordJob
    end
  end
end
