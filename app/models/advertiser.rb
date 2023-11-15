class Advertiser < ActiveRecord::Base
  has_many :promotions
  acts_as_mappable
  before_validation :geocode_address, :on => [:create, :update]
  validates :name, :address, :city, :state, :country, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_address
    "#{self.address}, #{self.city}, #{self.state} #{self.zip_code}, #{self.country}"
  end

  private

  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add('Endereço', " não pôde ser geolocalizado") unless geo.success
    if geo.success
      self.lat = geo.lat
      self.lng = geo.lng
      self.address ||= geo.street_number + geo.street_address
      self.city ||= geo.city
      self.state ||= geo.state
      self.country ||= geo.country
      self.zip_code ||= geo.zip
    end
  end
end
