class ImportFromFtpJob < ApplicationJob
  def perform(ftp_credential_id:)
    System.verify_active?

    job = Kiba.parse do
      download_directory = "imports/#{Rails.env}/#{Time.current.iso8601}"

      # Download files from FTP and parse each row in each file.
      source ETL::Sources::Ftp, ftp_credential_id: ftp_credential_id, download_directory: download_directory

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRows

      # Create a job for each row, on a queue for that type.
      destination ETL::Destinations::ImportQueues, filename: download_directory
    end

    Kiba.run(job)
  end
end
