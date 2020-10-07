class ETL::Transformations::AddHeaders
  def process(row)
    check_row_length(row)
    Hash[headers(row[0]).zip(row)]
  end

  private

  def headers(type)
    case type
    when 'ABA' then ETL::Headers::AbsenceRecord.all
    when 'ABD' then ETL::Headers::AbsenceRecord.delete_headers
    when 'ASA' then ETL::Headers::AssignmentRecord.all
    when 'ASD' then ETL::Headers::AssignmentRecord.delete_headers
    when 'COA' then ETL::Headers::CostingRecord.all
    when 'COD' then ETL::Headers::CostingRecord.delete_headers
    when 'CMA' then ETL::Headers::CompetencyRecord.all
    when 'CMD' then ETL::Headers::CompetencyRecord.delete_headers
    when 'DTA' then ETL::Headers::DisabilityRecord.all
    when 'DTD' then ETL::Headers::DisabilityRecord.delete_headers
    when 'ELA' then ETL::Headers::ElementRecord.all
    when 'ELD' then ETL::Headers::ElementRecord.delete_headers
    when 'ETA' then ETL::Headers::PersonEitRecord.all
    when 'ETD' then ETL::Headers::PersonEitRecord.delete_headers
    when 'LCA' then ETL::Headers::LocationRecord.all
    when 'LCD' then ETL::Headers::LocationRecord.delete_headers
    when 'ORA' then ETL::Headers::OrganisationRecord.all
    when 'ORD' then ETL::Headers::OrganisationRecord.delete_headers
    when 'PRA' then ETL::Headers::PersonRecord.all
    when 'PRD' then ETL::Headers::PersonRecord.delete_headers
    when 'PIA' then ETL::Headers::PositionEitRecord.all
    when 'PID' then ETL::Headers::PositionEitRecord.delete_headers
    when 'POA' then ETL::Headers::PositionRecord.all
    when 'POD' then ETL::Headers::PositionRecord.delete_headers
    when 'QLA' then ETL::Headers::QualificationRecord.all
    when 'QLD' then ETL::Headers::QualificationRecord.delete_headers
    when 'STA' then ETL::Headers::SitRecord.all
    when 'STD' then ETL::Headers::SitRecord.delete_headers
    when 'TRA' then ETL::Headers::TrainingAbsenceRecord.all
    when 'TRD' then ETL::Headers::TrainingAbsenceRecord.delete_headers
    end
  end

  def check_row_length(row)
    headers_count = headers(row[0]).try(:count) || 0
    if headers_count != row.count
      raise "Wrong number of columns for #{row[0]} row, expected #{headers_count}, got #{row.count}"
    elsif row.count == 0
      raise 'Empty row'
    end
  end
end
