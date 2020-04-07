class DailyImportJob < ApplicationJob
  queue_as :default

  def perform(filename:)
    job = Kiba.parse do
      # Read the data.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Transform rows to hashes with headers.
      transform ETL::Transformations::AddHeaders

      # Convert strings to dates.
      transform ETL::Transformations::StringToDate

      # Write it to the destination.
      destination ETL::Destinations::ActiveRecord
    end

    Kiba.run(job)
  end
end
