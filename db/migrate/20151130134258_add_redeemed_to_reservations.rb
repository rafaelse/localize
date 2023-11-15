class AddRedeemedToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :redeemed, :boolean, default: false
  end
end
