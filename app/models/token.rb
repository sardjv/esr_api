class Token < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :created_by, class_name: 'User', inverse_of: :tokens
  has_many :permissions, as: :subject, dependent: :destroy, index_errors: true

  validates :name, presence: true, uniqueness: true
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
    keys = permissions.map { |p| { resource: p.resource, action: p.action } }
    non_unique = keys.select { |key| keys.count(key) > 1 }.uniq
    return unless non_unique.count.positive?

    errors.add(
      :permissions,
      I18n.t(
        'models.permission.errors.uniqueness',
        resource: non_unique.first[:resource],
        action: non_unique.first[:action]
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
end
