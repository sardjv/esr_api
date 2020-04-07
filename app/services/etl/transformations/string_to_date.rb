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
    when 'PRA' then ETL::Headers::PersonRecord.date_headers
    when 'ABA' then ETL::Headers::AbsenceRecord.date_headers
    end
  end
end
