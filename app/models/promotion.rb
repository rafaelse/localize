class Promotion < ActiveRecord::Base
  belongs_to :category
  belongs_to :advertiser
  has_many :reservations
  has_many :reviews, through: :reservations

  has_attached_file :banner, styles: {medium: "400x400>", thumb: "250x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/
  validates :title, :description, :valid_from, :quantity, :price, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: -1, message: 'deve ser um número positivo'}
  validates :quantity, numericality: {only_integer: true, other_than: 0, message: 'não pode ser zero'}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :title, uniqueness: true
  validate :not_past_valid_from_date
  validate :not_negative_duration

  before_destroy :has_reservations_and_is_expired

  def started?
    Date.today >= self.valid_from
  end

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

  def review_avg
    reviews.average(:rating) if reviews.any?
  end

  class Error < StandardError
  end

  private

  def has_reservations_and_is_expired
    #byebug
    unless self.reservations.filter { |reservation| !reservation.redeemed }.empty? or self.expired?
      raise Error.new 'Promoção tem reservas feitas e ainda é válida!'
    end
  end
  def not_past_valid_from_date
    if valid_from < Date.today
      errors.add('Validade a partir de', " não pode ser no passado #{valid_from} #{Date.today}")
    end
  end

  def not_negative_duration
    if not valid_to.nil? and valid_to < valid_from
      errors.add('Validade até ', "não pode ter duração negativa")
    end
  end
end
