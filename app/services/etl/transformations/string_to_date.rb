class ETL::Transformations::StringToDate
  def process(row)
    row.update(row) do |key, value|
      if value && date_headers(row['Record Type']).include?(key)
        Date.strptime(value, '%Y%m%d')
      else
        value
      end
    end
  end

  private

  def date_headers(type)
    case type
    when 'ABA', 'ABD' then ETL::Headers::AbsenceRecord.date_headers
    when 'ASA', 'ASD' then ETL::Headers::AssignmentRecord.date_headers
    when 'COA', 'COD' then ETL::Headers::CostingRecord.date_headers
    when 'CMA', 'CMD' then ETL::Headers::CompetencyRecord.date_headers
    when 'DTA', 'DTD' then ETL::Headers::DisabilityRecord.date_headers
    when 'ELA', 'ELD' then ETL::Headers::ElementRecord.date_headers
    when 'ETA', 'ETD' then ETL::Headers::PersonEitRecord.date_headers
    when 'LCA', 'LCD' then ETL::Headers::LocationRecord.date_headers
    when 'ORA', 'ORD' then ETL::Headers::OrganisationRecord.date_headers
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.date_headers
    when 'PIA', 'PID' then ETL::Headers::PositionEitRecord.date_headers
    when 'POA', 'POD' then ETL::Headers::PositionRecord.date_headers
    when 'QLA', 'QLD' then ETL::Headers::QualificationRecord.date_headers
    when 'STA', 'STD' then ETL::Headers::SitRecord.date_headers
    when 'TRA', 'TRD' then ETL::Headers::TrainingAbsenceRecord.date_headers
    end
  end
end
