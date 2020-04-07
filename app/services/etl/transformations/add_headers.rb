class ETL::Transformations::AddHeaders
  def process(row)
    Hash[ETL::Headers::PersonRecord.all.zip(row)]
  end
end
