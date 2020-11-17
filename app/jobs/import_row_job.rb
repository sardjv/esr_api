class ImportRowJob < ApplicationJob
  # Shared code inherited by ImportAbsenceRecordJob, etc.
  def perform(row:, filename:)

    job = Kiba.parse do
      # Read the data.
      source ETL::Sources::Row, row: row

      # Transform pipeline.
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
