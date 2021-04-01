class ImportFromFtpJob < ApplicationJob
  def perform(ftp_credential_id: FtpCredential.singleton.try(:id))
    System.verify_active?

    job = Kiba.parse do
      # Download files from FTP.
      source ETL::Sources::Ftp, ftp_credential_id: ftp_credential_id

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRows

      # Create a job for each row, on a queue for that type.
      destination ETL::Destinations::ImportQueues

      # According to the spec we must clean up files from the remote FTP each day.
      post_process do
        FtpCredential.find(ftp_credential_id).delete_from_ftp
      end
    end

    Kiba.run(job)
  end
end
