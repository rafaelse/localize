class Promotion < ActiveRecord::Base
  validates :title, :description, :date_of_creation, :end_date, :quantity, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  validates :title, uniqueness: true                                                                                                                                                                                             
  validates :banner_url, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.'}
  validate :at_least_one_day_long
  
  private
    def at_least_one_day_long
      if (end_date - date_of_creation) < 1
        errors.add(:end_date, "must be at least one day later than today #{date_of_creation} #{end_date}")
      end
    end 
end
