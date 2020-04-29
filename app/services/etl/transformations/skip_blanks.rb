class ETL::Transformations::SkipBlanks
  def process(row)
    row.slice(*non_blank_headers(row['Record Type']))
  end

  private

  def non_blank_headers(type)
    case type
    when 'ABA', 'ABD' then ETL::Headers::AbsenceRecord.non_blank_headers
    when 'ASA', 'ASD' then ETL::Headers::AssignmentRecord.non_blank_headers
    when 'COA', 'COD' then ETL::Headers::CostingRecord.non_blank_headers
    when 'CMA', 'CMD' then ETL::Headers::CompetencyRecord.non_blank_headers
    when 'DTA', 'DTD' then ETL::Headers::DisabilityRecord.non_blank_headers
    when 'ELA', 'ELD' then ETL::Headers::ElementRecord.non_blank_headers
    when 'ETA', 'ETD' then ETL::Headers::PersonEitRecord.non_blank_headers
    when 'LCA', 'LCD' then ETL::Headers::LocationRecord.non_blank_headers
    when 'ORA', 'ORD' then ETL::Headers::OrganisationRecord.non_blank_headers
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.non_blank_headers
    when 'PIA', 'PID' then ETL::Headers::PositionEitRecord.non_blank_headers
    when 'POA', 'POD' then ETL::Headers::PositionRecord.non_blank_headers
    when 'QLA', 'QLD' then ETL::Headers::QualificationRecord.non_blank_headers
    when 'STA', 'STD' then ETL::Headers::SitRecord.non_blank_headers
    when 'TRA', 'TRD' then ETL::Headers::TrainingAbsenceRecord.non_blank_headers
    end
  end
end
