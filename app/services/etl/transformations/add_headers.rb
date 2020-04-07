class ETL::Transformations::AddHeaders
  def process(row)
    Hash[headers(row[0]).zip(row)]
  end

  private

  def headers(type)
    case type
    when 'PRA' then ETL::Headers::PersonRecord.all
    when 'ABA' then ETL::Headers::AbsenceRecord.all
    end
  end
end
