class AdvertiserController < ApplicationController
  before_action :authenticate_advertiser!

  def my_promotions
    @promotions = current_advertiser.promotions
  end

  def my_reservations
    @reservations = Reservation.joins(promotion: :advertiser).
        where('redeemed = false and advertiser_id = ?', current_advertiser.id)
  end
end
