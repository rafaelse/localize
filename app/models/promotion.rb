class Promotion < ActiveRecord::Base
  has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates :title, :description, :date_of_creation, :end_date, :quantity, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  validates :title, uniqueness: true                                                                                                                                                                                             
  validate :at_least_one_day_long
  
  private
    def at_least_one_day_long
      if (end_date - date_of_creation) < 1
        errors.add(:end_date, "must be at least one day later than today #{date_of_creation} #{end_date}")
      end
    end 
end
