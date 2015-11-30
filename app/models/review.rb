class Review < ActiveRecord::Base
  belongs_to :reservation
  validates :text, :rating, presence: true
end
