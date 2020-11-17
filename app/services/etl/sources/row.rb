class ETL::Sources::Row
  attr_reader :row

  def initialize(row:)
    @row = row
  end

  def each
    yield(row)
  end
end
