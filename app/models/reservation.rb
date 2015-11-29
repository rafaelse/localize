require 'rqrcode_png'

class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :promotion

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

    unless promotion.unlimited_quantity?
      promotion.quantity = promotion.quantity + 1
    end

    self.transaction do
      unless promotion.update_attribute(:quantity, promotion.quantity)
        raise ActiveRecord::Rollback
      end
      self.destroy
    end
  end

  def qr_code
    RQRCode::QRCode.new(self.id)
  end

  private

  def second_reservation?
    return Reservation.find_by(promotion_id: promotion.id, customer_id: customer.id)
  end
end
