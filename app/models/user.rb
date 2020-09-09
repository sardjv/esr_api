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
end
