class ImportFromFtpJob < ApplicationJob
  def perform(ftp_credential_id: FtpCredential.singleton.try(:id))
    System.verify_active?

    job = Kiba.parse do
      # Download any new files from the FTP server.
      source ETL::Sources::Ftp, ftp_credential_id: ftp_credential_id

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRows

      # Create a job for each row, on a queue for that type.
      destination ETL::Destinations::ImportQueues
    end

    Kiba.run(job)
  end
end
