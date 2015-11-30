
module CustomerAuthorization extend ActiveSupport::Concern

  private

  def current_customer_owns?(reservation)
    reservation and customer_signed_in? and reservation.customer == current_customer
  end

  def authorize_review_alteration!
    unless current_customer_owns?(@reservation)
      redirect_to root_url, notice: 'You can only review your reservations.'
    end
  end
end