class ETL::Transformations::SkipBlanks
  def process(row)
    row.slice(*non_blank_headers(row['Record Type']))
  end

  private

  def non_blank_headers(type)
    case type
    when 'ABA', 'ABD' then ETL::Headers::AbsenceRecord.non_blank_headers
    when 'LCA', 'LCD' then ETL::Headers::LocationRecord.non_blank_headers
    when 'POA', 'POD' then ETL::Headers::PositionRecord.non_blank_headers
    when 'PRA', 'PRD' then ETL::Headers::PersonRecord.non_blank_headers
    end
  end
end
