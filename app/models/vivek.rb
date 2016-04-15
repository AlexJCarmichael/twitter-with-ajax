class Vivek < ActiveRecord::Base
  belongs_to :dane

  validates :body, presence: :true
  validates_length_of :body, maximum: 140, minimum: 1

  def time
    "#{created_at.strftime('%r')} on #{created_at.strftime('%x')}"
  end

end
