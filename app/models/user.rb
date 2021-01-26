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

  has_many :tokens, inverse_of: :created_by

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
