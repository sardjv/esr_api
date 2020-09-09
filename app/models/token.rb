class Token < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  validates :token, presence: true
  encrypts :token
end
