class Review < ActiveRecord::Base
  belongs_to :reservation
  validates :text, presence: true
end
