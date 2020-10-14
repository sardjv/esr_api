class ImportFileJob < ApplicationJob
  # This job must be run on a synchronous queue with only 1 worker, because
  # each row must be imported in the order it occurred.
  queue_as :synchronous

  def perform(filename:)
    job = Kiba.parse do
      # Read the data.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Transform pipeline.
      transform ETL::Transformations::SkipUnwantedRows
      transform ETL::Transformations::AddHeaders
      transform ETL::Transformations::StringToDate
      transform ETL::Transformations::StringToTimestamp
      transform ETL::Transformations::SkipBlanks

      # Write it to the destination.
      destination ETL::Destinations::ActiveRecord, filename: filename
    end

    Kiba.run(job)
  end
end
