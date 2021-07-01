class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: 35 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true, on: :create

  has_secure_password
  has_secure_token :authentication_token
  before_save :to_lowercase

  private

  def to_lowercase
    email.downcase!
  end
end
