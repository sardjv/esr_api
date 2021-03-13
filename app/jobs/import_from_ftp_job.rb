class ImportFromFtpJob < ApplicationJob
  def perform(ftp_credential_id:)
    System.verify_active?

    job = Kiba.parse do
      # Download files from FTP.
      source ETL::Sources::Ftp, ftp_credential_id: ftp_credential_id

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRowsFtp

      # Create a job for each row, on a queue for that type.
      destination ETL::Destinations::ImportQueuesFtp
    end

    Kiba.run(job)
  end
end
