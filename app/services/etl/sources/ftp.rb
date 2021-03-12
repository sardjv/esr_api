require 'kiba-common/sources/csv'

class ETL::Sources::Ftp
  attr_reader :download_directory

  def initialize(ftp_credential_id:, download_directory:)
    @download_directory = download_directory
    ensure_destination(download_directory: download_directory)
    download_files(ftp_credential_id: ftp_credential_id, download_directory: download_directory)
  end

  def download_files(ftp_credential_id: ftp_credential_id, download_directory: download_directory)
    # Download files from FTP source into the new directory.
    ftp_credential = FtpCredential.find(ftp_credential_id)
    connection = Net::FTP.new
    connection.connect(ftp_credential.host, ftp_credential.port.to_i)
    connection.login(ftp_credential.user, ftp_credential.password)
    connection.passive = true
    connection.nlst('*.DAT').map do |filename|
      connection.get(filename, "#{download_directory}/#{filename}")
    end
    connection.close
  end

  def ensure_destination(download_directory:)
    Dir.mkdir('imports') unless Dir.exist?('imports')
    Dir.mkdir("imports/#{Rails.env}") unless Dir.exist?("imports/#{Rails.env}")
    Dir.mkdir(download_directory)
  end

  def each(&block)
    # For each file, parse the data from tilde separated values to an array.
    # Each file will be read sequentially.
    # https://github.com/thbar/kiba/wiki/Can-Kiba-handle-multiple-sources-and-destinations%3F#multiple-sources-behaviour
    Dir.children(download_directory).each do |filename|
      filename = File.join(download_directory, filename)

      # Return each row from this file to the pipeline.
      Kiba::Common::Sources::CSV.new(
        filename: filename,
        csv_options: {
          headers: false,
          col_sep: '~',
          encoding: 'ISO-8859-1',
          liberal_parsing: true
        }
      ).each(&block)
    end
  end
end
