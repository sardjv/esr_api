require 'kiba-common/sources/csv'

class ETL::Sources::File
  attr_reader :filename

  def initialize(filename:)
    @filename = filename
  end

  def each(&block)
    Kiba::Common::Sources::CSV.new(
        filename: filename,
        csv_options: {
            headers: false,
            col_sep: '~',
            encoding: 'ISO-8859-1',
            liberal_parsing: true
        }
    ).each { |row| yield(row: row, filename: filename) }
  end
end
