class ETL::Transformations::SkipUnwantedRows
  def process(row)
    row unless unwanted.include?(row[0])
  end

  private

  def unwanted
    [
      'HDR', # File header row.
      'CDA' # Undocumented record type? Excluding for now as not clear what the headers should be.
    ].freeze
  end
end
