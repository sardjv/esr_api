class ETL::Transformations::SkipUnwantedRows
  def process(row)
    row unless unwanted.include?(row[0])
  end

  private

  def unwanted
    [
      'HDR', # File header row.
      'CDA', # Undocumented record type. Excluded as it's not clear what the headers should be.
      'TRL' # File trailer row.
    ].freeze
  end
end
