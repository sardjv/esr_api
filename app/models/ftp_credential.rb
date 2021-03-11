class FtpCredential < ApplicationRecord
  belongs_to :created_by, class_name: 'User', inverse_of: :ftp_credentials

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :host, presence: true
  validates :port, presence: true
  validates :user, presence: true
  validates :password, presence: true
  validates :path, presence: true
  validate :validate_singleton, on: :create
  validate :validate_password_is_secret, on: :create

  encrypts :host
  encrypts :port
  encrypts :user
  encrypts :password
  encrypts :path

  # Currently we only support 1 FTP Credential at a time.
  def self.singleton
    @singleton ||= FtpCredential.first
  end

  # Readonly to ensure created_by is always correct. If it needs to change,
  # create a new one instead.
  def readonly?
    persisted?
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
