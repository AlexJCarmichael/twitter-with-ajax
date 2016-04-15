class Dane < ActiveRecord::Base
  has_many :viveks, dependent: :destroy

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true

  has_secure_password
  
def danish
  "🇩🇰 " + :username.to_s
end

end
