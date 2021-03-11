class ImportFromFtpJob < ApplicationJob
  def perform(ftp_credential_id:)
    System.verify_active?

    job = Kiba.parse do
      # Check for a directory with today's date. If it exists, error. If it doesn't exist, create it and then delete the directory from 8 days ago, if it exists.

      Dir.mkdir('imports') unless Dir.exist?('imports')
      Dir.mkdir("imports/#{Rails.env}") unless Dir.exist?("imports/#{Rails.env}")
      path = "imports/#{Rails.env}/#{Time.current.iso8601}"
      Dir.mkdir(path)

      # Download files from FTP source into the new directory.
      ftp_credential = FtpCredential.find(ftp_credential_id)
      connection = Net::FTP.new
      connection.connect(ftp_credential.host, ftp_credential.port.to_i)
      connection.login(ftp_credential.user, ftp_credential.password)
      connection.passive = true
      connection.nlst('*.DAT').map do |filename|
        connection.get(filename, "#{path}/#{filename}")
      end
      connection.close

      Dir.children(path).each do |filename|
        # For each file, parse the data from tilde separated values to an array.
        # Each file will be read sequentially.
        # https://github.com/thbar/kiba/wiki/Can-Kiba-handle-multiple-sources-and-destinations%3F#multiple-sources-behaviour
        source ETL::Sources::TildeSeparatedValues, filename: File.join(path, filename)
      end

      # Skip unhandled rows.
      transform ETL::Transformations::SkipUnwantedRows

      # Create a job for each row, on a queue for that type.
      destination ETL::Destinations::ImportQueues, filename: File.join(path, Dir.children(path).first)
    end

    Kiba.run(job)
  end
end
