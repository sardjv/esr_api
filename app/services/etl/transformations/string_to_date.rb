class ETL::Transformations::StringToDate
  def process(row)
    row.update(row) do |key, value|
      if value && ETL::Headers::PersonRecord.date_headers.include?(key)
        Date.strptime(value, '%Y%m%d')
      else
        value
      end
    end
  end
end
