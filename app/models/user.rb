class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
end
