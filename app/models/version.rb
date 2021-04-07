class Version < ApplicationRecord
  scope :imported, -> {  where(whodunnit_type: 'Import') }

  def self.imported_filenames
    imported.pluck(:whodunnit).uniq.compact
  end
end
