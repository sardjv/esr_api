require 'net/ftp'

class FtpCredential < ApplicationRecord
  LOCAL_DOWNLOADS_DIRECTORY = 'data/downloads'.freeze
  LOCAL_UPLOADS_DIRECTORY = 'data/uploads'.freeze
  REMOTE_DOWNLOADS_DIRECTORY = 'out'.freeze
  REMOTE_UPLOADS_DIRECTORY = 'in'.freeze

  belongs_to :created_by, class_name: 'User', inverse_of: :ftp_credentials

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :host, presence: true
  validates :port, presence: true
  validates :user, presence: true
  validates :password, presence: true
  validates :path, presence: true
  validates :virtual_private_database_number, presence: true, length: { is: 3 }
  validate :validate_singleton, on: :create
  validate :validate_password_is_secret, on: :create

  encrypts :host
  encrypts :port
  encrypts :user
  encrypts :password
  encrypts :path
  encrypts :virtual_private_database_number

  def connect
    connection = Net::FTP.new(host, ssl: true)
    connection.connect(host, port.to_i)
    connection.login(user, password)
    connection
  end

  def download_files
    destination_path = local_downloads_path

    # Ensure destination path exists and is empty.
    FtpCredential.ensure_path(path: destination_path)

    # Establish FTP connection.
    connection = connect

    # Loop through all files on the FTP, downloading each one into the destination_path.
    connection.list('-1', remote_download_path).each do |filename|
      # Download the file.
      connection.get("#{remote_download_path}/#{filename}", "#{destination_path}/#{filename}")

      # Delete it from the remote (required to get the next files tomorrow).
      connection.delete("#{remote_download_path}/#{filename}")
    end

    # Close FTP connection.
    connection.close

    # Check filenames match what is expected.
    FtpCredential.validate_filenames(destination_path: destination_path)

    destination_path
  end

  # Upload a file to the remote FTP server requesting a full snapshot of the current data.
  def request_snapshot
    # Establish FTP connection.
    connection = connect

    # Create the file to be placed on the remote FTP server.
    filename = snapshot_request_filename
    upload_file_path = create_snapshot_request_file(filename: filename)

    # Add the file to the remote directory.
    connection.put(upload_file_path, File.join(remote_upload_path, filename))

    # Close FTP connection.
    connection.close
  end

  def create_snapshot_request_file(filename:)
    upload_file_path = File.join(local_uploads_path, filename)
    FtpCredential.ensure_path(path: local_uploads_path)
    File.open(upload_file_path, 'w') { |f| f.write(snapshot_request_file_contents(filename: filename)) }
    upload_file_path
  end

  def snapshot_request_file_contents(filename:)
    ['HDR', filename, Time.current.strftime('%Y%m%d %H%M%S')].join('~')
  end

  def snapshot_request_filename
    "GO_#{virtual_private_database_number}_GDW_GDR_#{Time.current.strftime('%Y%m%d')}_00000001.DAT"
  end

  def local_downloads_path
    File.join(FtpCredential::LOCAL_DOWNLOADS_DIRECTORY, Rails.env, Time.current.iso8601)
  end

  def local_uploads_path
    File.join(LOCAL_UPLOADS_DIRECTORY, Rails.env, Time.current.iso8601)
  end

  def remote_download_path
    File.join(path, REMOTE_DOWNLOADS_DIRECTORY)
  end

  def remote_upload_path
    File.join(path, REMOTE_UPLOADS_DIRECTORY)
  end

  # Readonly to ensure created_by is always correct. If it needs to change,
  # create a new one instead.
  def readonly?
    persisted?
  end

  # Currently we only support 1 FTP Credential at a time.
  def self.singleton
    @singleton ||= FtpCredential.first
  end

  def self.valid_filename_regex
    # Check that filename ends in the format YYYYMMDD_IIIIIIII.DAT.
    # IIIIIII is an ordered index.
    # Example valid seed file: GO_277_GDW_GDR_20200602_00001632.DAT
    # Example valid delta file: GO_277_GDW_GOC_20200603_00001633.DAT
    Regexp.new('.*([0-9]{4})(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])_([0-9]{8}).DAT')
  end

  def self.ensure_path(path:)
    path.split('/').inject('.') do |acc, directory|
      acc = File.join(acc, directory)
      Dir.mkdir(acc) unless Dir.exist?(acc)
      acc
    end
  end

  def self.validate_filenames(destination_path:)
    raise InvalidFilenameError unless Dir.children(destination_path).all? { |f| valid_filename_regex.match?(f) }
  end

  private

  def validate_singleton
    return unless FtpCredential.exists?

    errors.add(:host, I18n.t('models.ftp_credential.errors.must_be_singleton'))
  end

  def validate_password_is_secret
    return if name.nil? || password.nil?
    return unless name.downcase.gsub(/\s/, '').include?(password.downcase.gsub(/\s/, ''))

    errors.add(:password, I18n.t('models.ftp_credential.errors.password_must_be_secret'))
  end
end
