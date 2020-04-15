class DailyImportJob < ApplicationJob
  queue_as :default

  def perform(filename:)
    job = Kiba.parse do
      # Read the data.
      source ETL::Sources::TildeSeparatedValues, filename: filename

      # Transform pipeline.
      transform ETL::Transformations::AddHeaders
      transform ETL::Transformations::StringToDate
      transform ETL::Transformations::StringToTimestamp
      transform ETL::Transformations::SkipBlanks

      # Write it to the destination.
      destination ETL::Destinations::ActiveRecord
    end

    Kiba.run(job)
  end
end
