class Source < ApplicationRecord
  belongs_to :created_by, class_name: 'User', inverse_of: :sources

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :source, presence: true

  encrypts :source
  blind_index :source

  # Currently we only support 1 source.
  def self.singleton
    @source ||= Source.first
  end

  def readonly?
    persisted?
  end
end
