class Token < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  validates :encrypted_token, presence: true
end
