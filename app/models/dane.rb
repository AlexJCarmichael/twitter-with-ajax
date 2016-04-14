class Dane < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: :true
  validates_length_of :body, maximum: 140, minimum: 1
end
