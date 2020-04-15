class ETL::Transformations::AddHeaders
  def process(row)
    Hash[headers(row[0]).zip(row)]
  end

  private

  def headers(type)
    case type
    when 'ABA', 'ABD' then ETL::Headers::AbsenceRecord.all
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.all
    when 'POA', 'POD' then ETL::Headers::PositionRecord.all
    end
  end
end
