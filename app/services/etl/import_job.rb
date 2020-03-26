require 'kiba-common/sources/csv'

module ETL::ImportJob
  module_function

  def setup(filename:)
    Kiba.parse do
      # Read the data.
      source Kiba::Common::Sources::CSV,
              filename: filename,
              csv_options: {
                headers: false,
                col_sep: '~'
              }

      # Transform it as needed.
      transform ETL::Transformations::PersonRecord

      # Write it to the destination.
      destination ETL::Destinations::PersonRecord
    end
  end
end
