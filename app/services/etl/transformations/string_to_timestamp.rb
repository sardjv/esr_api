class ETL::Transformations::StringToTimestamp
  def process(row)
    row.update(row) do |key, value|
      if value && timestamp_headers(row['Record Type']).include?(key)
        Time.strptime(value, '%Y%m%d %H%M%S')
      else
        value
      end
    end
  end

  private

  def timestamp_headers(type)
    case type
    when 'ABA', 'ABD' then ETL::Headers::AbsenceRecord.timestamp_headers
    when 'ASA', 'ASD' then ETL::Headers::AssignmentRecord.timestamp_headers
    when 'COA', 'COD' then ETL::Headers::CostingRecord.timestamp_headers
    when 'CMA', 'CMD' then ETL::Headers::CompetencyRecord.timestamp_headers
    when 'DTA', 'DTD' then ETL::Headers::DisabilityRecord.timestamp_headers
    when 'ELA', 'ELD' then ETL::Headers::ElementRecord.timestamp_headers
    when 'ETA', 'ETD' then ETL::Headers::PersonEitRecord.timestamp_headers
    when 'LCA', 'LCD' then ETL::Headers::LocationRecord.timestamp_headers
    when 'ORA', 'ORD' then ETL::Headers::OrganisationRecord.timestamp_headers
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.timestamp_headers
    when 'PIA', 'PID' then ETL::Headers::PositionEitRecord.timestamp_headers
    when 'POA', 'POD' then ETL::Headers::PositionRecord.timestamp_headers
    when 'QLA', 'QLD' then ETL::Headers::QualificationRecord.timestamp_headers
    when 'STA', 'STD' then ETL::Headers::SitRecord.timestamp_headers
    when 'TRA', 'TRD' then ETL::Headers::TrainingAbsenceRecord.timestamp_headers
    end
  end
end
