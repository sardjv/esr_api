class ETL::Destinations::ActiveRecord
  attr_reader :rows_for_insert

  def initialize
    @rows_for_insert = []
  end

  def write(row)
    timestamps = { 'created_at' => Time.current, 'updated_at' => Time.current }
    @rows_for_insert << row.merge(timestamps)
  end

  def close
    @rows_for_insert.group_by { |row| row['Record Type'] }.each do |key, rows|
      case key
      when 'PRA' then ::PersonRecord.insert_all!(rows)
      when 'ABA' then ::AbsenceRecord.insert_all!(rows)
      end
    end
  end
end
