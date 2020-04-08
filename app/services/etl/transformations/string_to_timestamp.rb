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
    when 'PRA' then ETL::Headers::PersonRecord.timestamp_headers
    when 'ABA' then ETL::Headers::AbsenceRecord.timestamp_headers
    end
  end
end
