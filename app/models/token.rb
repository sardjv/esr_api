# == Schema Information
#
# Table name: tokens
#
#  id               :bigint           not null, primary key
#  name             :string(255)      not null
#  token_ciphertext :string(255)      not null
#  token_viewed_at  :datetime
#  created_by_id    :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token_bidx       :string(255)
#
class Token < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :created_by, class_name: 'User', inverse_of: :tokens
  has_many :permissions, as: :subject, dependent: :destroy, index_errors: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :token, presence: true
  validates :permissions, presence: true
  accepts_nested_attributes_for :permissions, reject_if: :all_blank, allow_destroy: true
  validates_associated :permissions
  validate :permissions_all_unique

  encrypts :token
  blind_index :token

  # Tokens should only be viewed once.
  def token_one_time
    if token_viewed_at
      I18n.t('models.token.already_viewed', when: time_ago_in_words(token_viewed_at))
    else
      update(token_viewed_at: Time.current)
      token
    end
  end

  # When creating multiple new permissions at once, only allow
  # one new permission per resource + action.
  def permissions_all_unique
    return unless (non_unique = find_non_unique(permissions))

    errors.add(
      :permissions,
      I18n.t(
        'models.permission.errors.uniqueness',
        resource: non_unique[:resource],
        action: non_unique[:action]
      )
    )
  end

  def self.verify(inbound_token:, resource:, action:)
    raise AuthenticationError unless (token = Token.find_by(
      token: inbound_token
    ))

    raise PermissionError unless (permission = token.permissions.find_by(
      resource: resource,
      action: action
    ))

    { token: token, permission: permission }
  end

  def readonly?
    persisted? && changes.keys != ['token_viewed_at']
  end

  private

  def find_non_unique(permissions)
    keys = permissions.map { |p| { resource: p.resource, action: p.action } }
    keys.find { |key| keys.count(key) > 1 }
  end
end
