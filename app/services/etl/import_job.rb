module ETL::ImportJob
  module_function

  def setup(filename:)
    Kiba.parse do
      # Read the data.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Transform it as needed.
      transform ETL::Transformations::PersonRecord

      # Write it to the destination.
      destination ETL::Destinations::PersonRecord
    end
  end
end
