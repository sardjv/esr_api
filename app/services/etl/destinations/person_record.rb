class ETL::Destinations::PersonRecord
  def write(row)
    PersonRecord.create(row.slice('PersonID'))
  end
end
