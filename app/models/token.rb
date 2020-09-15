class Token < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :created_by, class_name: 'User'
  validates :name, presence: true, uniqueness: { scope: :created_by_id }
  validates :token, presence: true
  encrypts :token

  # Tokens should only be viewed once.
  def token_one_time
    if token_viewed_at
      I18n.t('models.token.already_viewed', when: time_ago_in_words(token_viewed_at))
    else
      update(token_viewed_at: Time.current)
      token
    end
  end

  def self.verify(token)
    raise VerificationError unless Token.any? { |t| t.token == token }

    true
  end
end
