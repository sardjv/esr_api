class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :tokens, inverse_of: :created_by, dependent: :restrict_with_exception

  # Devise method used to send email requesting confirmation. We need
  # confirmation but won't have the ability to send emails so it needs to be
  #  done manually by admins via the UI. We override this method to do nothing.
  def send_on_create_confirmation_instructions
    nil
  end

  def activated
    confirmed_at.present?
  end

  def activated=(value)
    if value == '1'
      update(confirmed_at: Time.current)
    else
      update(confirmed_at: nil)
    end
  end
end
