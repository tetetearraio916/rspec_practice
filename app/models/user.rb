class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password_digest, presence: true

  has_secure_password

  has_many :blogs

  def feed
    Blog.with_read(:published).or(Blog.where(user: id)).preload(:user).order(created_at: :desc)
  end
end
