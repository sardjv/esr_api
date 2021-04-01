class RequestSnapshotJob < ApplicationJob
  def perform(ftp_credential_id: FtpCredential.singleton.try(:id))
    System.verify_active?

    FtpCredential.find(ftp_credential_id).request_snapshot
  end
end
