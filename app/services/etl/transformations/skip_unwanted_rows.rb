class ETL::Transformations::SkipUnwantedRows
  def process(row)
    row unless unwanted.include?(row[0])
  end

  private

  def unwanted
    [
      'HDR'
    ].freeze
  end
end
