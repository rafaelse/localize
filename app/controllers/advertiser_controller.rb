class AdvertiserController < ApplicationController
  before_filter :authenticate_advertiser!

  def my_promotions
    @promotions = current_advertiser.promotions
  end

  def my_reservations
  end

end
