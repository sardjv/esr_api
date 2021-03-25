require 'kiba-common/sources/csv'

class ETL::Sources::Ftp
  attr_reader :ftp_credential_id, :destination_path

  def initialize(ftp_credential_id:)
    ftp_credential = FtpCredential.find(ftp_credential_id)
    @destination_path = "downloads/#{Rails.env}/#{Time.current.iso8601}"
    ftp_credential.download_files(destination_path: destination_path)
  end

  def each(&block)
    # For each file, parse the data from tilde separated values to an array.
    # Each file will be read sequentially.
    # https://github.com/thbar/kiba/wiki/Can-Kiba-handle-multiple-sources-and-destinations%3F#multiple-sources-behaviour
    Dir.children(destination_path).sort_by { |f| f.scan(FtpCredential.valid_filename_regex) }.each do |filename|
      # Return each row from this file to the pipeline.
      Kiba::Common::Sources::CSV.new(
        filename: File.join(destination_path, filename),
        csv_options: {
          headers: false,
          col_sep: '~',
          encoding: 'ISO-8859-1',
          liberal_parsing: true
        }
      ).each { |row| yield(row: row, filename: filename) }
    end
  end
end
