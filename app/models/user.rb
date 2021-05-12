# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  point_of_contact       :boolean          default(FALSE), not null
#  time_zone              :string(255)      default("London"), not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :at_least_one_confirmed_user
  validate :at_least_one_point_of_contact_user

  has_many :tokens, inverse_of: :created_by, foreign_key: 'created_by_id', dependent: :restrict_with_error
  has_many :ftp_credentials, inverse_of: :created_by, foreign_key: 'created_by_id', dependent: :restrict_with_error

  before_create :activate_first_user

  # Devise method used to send email requesting confirmation. We need
  # confirmation but won't have the ability to send emails so it needs to be
  # done manually by admins via the UI. We override this method to do nothing.
  def send_on_create_confirmation_instructions
    nil
  end

  def activated
    confirmed_at.present?
  end

  def activated=(value)
    self.confirmed_at = (value == '1' ? Time.current : nil)
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def at_least_one_confirmed_user
    return unless removing?('confirmed_at')
    return if User.where.not(confirmed_at: nil).many?

    errors.add(:activated, I18n.t('models.user.errors.cant_deactivate'))
  end

  def at_least_one_point_of_contact_user
    return unless removing?('point_of_contact')
    return if User.where(point_of_contact: true).many?

    errors.add(:point_of_contact, I18n.t('models.user.errors.cant_remove_only_point_of_contact'))
  end

  def removing?(field)
    changed.include?(field) && changes[field].last.blank?
  end

  # The very first admin on the platform should be activated
  # by default, so they can activate any subsequent users.
  def activate_first_user
    return if User.any?

    assign_attributes(
      confirmed_at: Time.current,
      point_of_contact: true
    )
  end
end
