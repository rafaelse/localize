module AdvertiserAuthorization
  extend ActiveSupport::Concern

  def current_advertiser_owns?(promotion)
    promotion and advertiser_signed_in? and promotion.advertiser == current_advertiser
  end

  def authorize_promotion_alteration!
    unless current_advertiser_owns?(@promotion)
      redirect_to root_url, notice: 'You can only alter your promotions.'
    end
  end


end