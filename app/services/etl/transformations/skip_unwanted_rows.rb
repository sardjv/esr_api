class ETL::Transformations::SkipUnwantedRows
  # args are { row: [], filename: "" }
  def process(args)
    args unless unwanted.include?(args[:row][0])
  end

  private

  def unwanted
    [
      'HDR', # File header row.
      'LOV', # List Of Values. Excluded as it's not clear what the headers should be.
      'TRL' # File trailer row.
    ].freeze
  end
end
