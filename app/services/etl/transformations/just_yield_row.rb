class ETL::Transformations::JustYieldRow

  # args are { row: [], filename: "" } when coming in from ETL::Transformations::SkipUnwantedRows
  # when this is sent to a transformation like ETL::Transformations::AddHeaders it's only expecting a row

  def process(args)
    args[:row]
  end
end
