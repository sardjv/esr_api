class ETL::Transformations::AddHeaders
  def process(row)
    Hash[headers(row[0]).zip(row)]
  end

  private

  def headers(type)
    case type
    when 'ABA', 'ABD' then ETL::Headers::AbsenceRecord.all
    when 'ASA', 'ASD' then ETL::Headers::AssignmentRecord.all
    when 'COA', 'COD' then ETL::Headers::CostingRecord.all
    when 'CMA', 'CMD' then ETL::Headers::CompetencyRecord.all
    when 'DTA', 'DTD' then ETL::Headers::DisabilityRecord.all
    when 'ELA', 'ELD' then ETL::Headers::ElementRecord.all
    when 'ETA', 'ETD' then ETL::Headers::PersonEITRecord.all
    when 'LCA', 'LCD' then ETL::Headers::LocationRecord.all
    when 'ORA', 'ORD' then ETL::Headers::OrganisationRecord.all
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.all
    when 'PIA', 'PID' then ETL::Headers::PositionEITRecord.all
    when 'POA', 'POD' then ETL::Headers::PositionRecord.all
    when 'QLA', 'QLD' then ETL::Headers::QualificationRecord.all
    when 'STA', 'STD' then ETL::Headers::SITRecord.all
    when 'TRA', 'TRD' then ETL::Headers::TrainingAbsenceRecord.all
    end
  end
end
