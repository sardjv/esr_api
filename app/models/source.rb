class Source < ApplicationRecord
  belongs_to :created_by, class_name: 'User', inverse_of: :sources

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :source, presence: true
  validate :validate_singleton, on: :create

  encrypts :source
  blind_index :source

  # Currently we only support 1 source.
  def self.singleton
    @singleton ||= Source.first
  end

  def readonly?
    persisted?
  end

  def validate_singleton
    return unless Source.exists?

    errors.add(:source, I18n.t('models.source.errors.must_be_singleton'))
  end
end
