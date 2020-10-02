class ETL::Transformations::SkipUnwantedRows
  def process(row)
    row if wanted?(row[0])
  end

  private

  def wanted?(type)
    unwanted.exclude?(type)
  end

  def unwanted
    [
      'HDR'
    ].freeze
  end
end
