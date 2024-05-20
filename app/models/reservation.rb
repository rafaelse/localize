require 'rqrcode_png'

class Reservation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :promotion
  has_one :review

  def make_reservation!
    errors.add('Promoção', 'não iniciada!') unless promotion.started?
    errors.add('Reserva ', 'já realizada!') if second_reservation?
    errors.add('Consumidor', ' não informado!') unless customer
    errors.add('Promoção', ' esgotada!') if promotion.sold_out?
    errors.add('Validade', ' expirada!') if promotion.expired?

    if errors.any?
      false
    else
      self.transaction do
        unless promotion.unlimited_quantity?
            raise ActiveRecord::Rollback unless promotion.update_attribute(:quantity, promotion.quantity - 1)
        end
        self.save!
      end
    end
  end

  def cancel!
    if self.redeemed?
      errors.add('Reserva', ' já resgatada!') if self.redeemed?
      false
    else
      unless promotion.unlimited_quantity?
        promotion.quantity = promotion.quantity + 1
        self.transaction do
          raise ActiveRecord::Rollback unless promotion.update_attribute(:quantity, promotion.quantity)
        end
      end
      self.destroy
    end
  end

  def qr_code
    RQRCode::QRCode.new(self.code)
  end

  def redeemed?
    self.redeemed
  end

  def redeem!
    if promotion.expired? and promotion.advertiser != current_advertiser and self.redeemed?
      errors.add('Promoção ', ' expirou!') if promotion.expired?
      errors.add('Comerciante', ' não é o responsável pela promoção!') if promotion.advertiser != current_advertiser
      errors.add('Reserva', ' já resgatada!') if self.redeemed?
      throw :abort
    else
      self.update_attribute(:redeemed, true)
    end
  end

  private

  def second_reservation?
    Reservation.find_by(promotion_id: promotion.id, customer_id: customer.id, redeemed: false)
  end
end
