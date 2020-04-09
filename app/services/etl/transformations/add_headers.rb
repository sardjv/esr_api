class ETL::Transformations::AddHeaders
  def process(row)
    Hash[headers(row[0]).zip(row)]
  end

  private

  def headers(type)
    case type
    when 'ABA' then ETL::Headers::AbsenceRecord.all
    when 'PRA' then ETL::Headers::PersonRecord.all
    when 'POA' then ETL::Headers::PositionRecord.all
    end
  end
end
