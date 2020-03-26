class ImportJob < ApplicationJob
  queue_as :default

  def perform(filename:)
    job = Kiba.parse do
      # Read the data.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Transform it as needed.
      transform ETL::Transformations::PersonRecord

      # Write it to the destination.
      destination ETL::Destinations::PersonRecord
    end

    Kiba.run(job)
  end
end
