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
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.date_headers
    when 'POA', 'POD' then ETL::Headers::PositionRecord.date_headers
    end
  end
end
