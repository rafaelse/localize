class Advertiser < ActiveRecord::Base
  has_many :promotions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_address
    "#{self.address}, #{self.city}, #{self.zip_code} \n #{self.estate}, #{self.country}"
  end

end
