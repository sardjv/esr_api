class ETL::Transformations::SkipBlanks
  def process(row)
    row.slice(*non_blank_headers(row['Record Type']))
  end

  private

  def non_blank_headers(type)
    case type
    when 'ABA' then ETL::Headers::AbsenceRecord.non_blank_headers
    when 'PRA' then ETL::Headers::PersonRecord.non_blank_headers
    when 'POA' then ETL::Headers::PositionRecord.non_blank_headers
    end
  end
end
