class Advertiser < ActiveRecord::Base
  has_many :promotions
  acts_as_mappable
  before_validation :geocode_address, :on => [:create, :update]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_address
    "#{self.address}, #{self.city}, #{self.estate} #{self.zip_code}, #{self.country}"
  end

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end


end
