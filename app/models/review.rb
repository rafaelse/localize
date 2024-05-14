class Review < ActiveRecord::Base
  belongs_to :reservation
  validates :text, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
