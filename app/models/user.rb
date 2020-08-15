class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :memos, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :nickname, presence: true, uniqueness: { case_sensitive: true, message: 'has already been taken' }
  validates :email, uniqueness: { case_sensitive: true, message: 'has already been taken' }
  validates :password, format: { with: PASSWORD_REGEX, message: 'input half-width numbers and characters.' }

end
