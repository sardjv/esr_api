class DailyImportJob < ApplicationJob
  queue_as :default

  def perform(filename:)
    job = Kiba.parse do
      # Read the data.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Add headers.
      transform ETL::Transformations::AddHeaders

      # Transform strings to dates.
      transform ETL::Transformations::StringToDate

      # Transform strings to timestamps.
      transform ETL::Transformations::StringToTimestamp

      # Write it to the destination.
      destination ETL::Destinations::ActiveRecord
    end

    Kiba.run(job)
  end
end
