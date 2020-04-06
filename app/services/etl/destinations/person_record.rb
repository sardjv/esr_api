class ETL::Destinations::PersonRecord
  attr_reader :rows_for_insert

  def initialize
    @rows_for_insert = []
  end

  def write(row)
    timestamps = { 'created_at' => Time.current, 'updated_at' => Time.current }
    @rows_for_insert << row.merge(timestamps)
  end

  def close
    ::PersonRecord.insert_all!(@rows_for_insert)
  end
end
