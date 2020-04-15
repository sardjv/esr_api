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
    when 'LCA', 'LCD' then ETL::Headers::LocationRecord.timestamp_headers
    when 'POA', 'POD' then ETL::Headers::PositionRecord.timestamp_headers
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.timestamp_headers
    end
  end
end
