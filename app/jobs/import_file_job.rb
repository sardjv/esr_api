class ImportFileJob < ApplicationJob
  def perform(filename:)
    System.verify_active?

    job = Kiba.parse do
      # Parse the data from tilde separated values to an array.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRows

      # Create a job for each row, on a queue for that type.
      destination ETL::Destinations::ImportQueues, filename: filename
    end

    Kiba.run(job)
  end
end
