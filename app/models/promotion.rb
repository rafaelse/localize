class Promotion < ActiveRecord::Base
  belongs_to :category
  
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates :title, :description, :valid_from, :quantity, :price, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: -1, message: 'Quantity must be a positive number or be unlimited'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true                                                                                                                                                                                             
  validate :not_past_valid_from_date
  validate :not_negative_duration
  
  private
    def not_past_valid_from_date
      if valid_from < Date.today
        errors.add(:valid_from, "cannot be in the past #{valid_from} #{Date.today}")
      end
    end
    
    def not_negative_duration
      if not valid_to.nil? and valid_to < valid_from
        errors.add(:valid_to, "cannot have negative duration")
      end
    end
end
