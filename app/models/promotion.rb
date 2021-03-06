class Promotion < ActiveRecord::Base
  belongs_to :category
  belongs_to :advertiser
  has_many :reservations
  
  has_attached_file :banner, styles: {medium: "400x400>", thumb: "250x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates :title, :description, :valid_from, :quantity, :price, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: -1, message: 'Quantity must be a positive number or be unlimited'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true                                                                                                                                                                                             
  validate :not_past_valid_from_date
  validate :not_negative_duration
  
  def make_time_unlimited
    self.valid_to = nil
  end
  
  def make_quantity_unlimited
    self.quantity = -1
  end
  
  def unlimited_time?
    !self.valid_to
  end
  
  def unlimited_quantity?
    self.quantity == -1
  end
  
  def sold_out?
    self.quantity == 0
  end
  
  def expired?
    self.valid_to != nil and Date.today > self.valid_to
  end
  
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
