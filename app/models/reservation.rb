require 'rqrcode_png'

class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :promotion
  has_one :review

  def make_reservation!
    #byebug
    unless promotion.sold_out? or promotion.expired? or not customer or second_reservation?
      unless promotion.unlimited_quantity?
        self.transaction do
          unless promotion.update_attribute(:quantity, promotion.quantity - 1)
            raise ActiveRecord::Rollback
          end
          self.save!
        end
      end
      return true
    else
      errors.add(:reservation, 'You can only reserve a promotion once!') if second_reservation?
      errors.add(:customer, 'Not a customer linked to the reservation!') if not customer
      errors.add(:quantity, 'Promotion sold out!') if promotion.sold_out?
      errors.add(:valid_to, 'Promotion expired!') if promotion.expired?
      return false
    end
  end

  def cancel!

    unless promotion.unlimited_quantity? or self.redeemed?
      promotion.quantity = promotion.quantity + 1
      self.transaction do
        unless promotion.update_attribute(:quantity, promotion.quantity)
          raise ActiveRecord::Rollback
        end
        self.destroy
      end
      return true
    else
      errors.add(:reservation, 'already redeemed!') if self.redeemed?
      return false
    end
  end


  def qr_code
    RQRCode::QRCode.new(self.code)
  end

  def redeemed?
    self.redeemed
  end

  def redeem!
    unless promotion.expired? and promotion.advertiser != current_advertiser and self.redeemed?
      self.update_attribute(:redeemed, true)
      return true
    else
      errors.add(:promotion, 'expired!') if promotion.expired?
      errors.add(:advertiser, 'does not own promotion!') if promotion.advertiser != current_advertiser
      errors.add(:reservation, 'already redeemed') if self.redeemed?
      return false
    end
  end

  private

  def second_reservation?
    return Reservation.find_by(promotion_id: promotion.id, customer_id: customer.id)
  end
end
