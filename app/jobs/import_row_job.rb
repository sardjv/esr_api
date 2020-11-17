class ImportRowJob < ApplicationJob
  # Shared code inherited by ImportAbsenceRecordJob, etc.
  def perform(row:, filename:)
    job = Kiba.parse do
      # Yield the row.
      source ETL::Sources::Row, row: row

      # Clean data.
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
