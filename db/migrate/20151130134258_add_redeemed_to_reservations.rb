class AddRedeemedToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :redeemed, :boolean, default: false
  end
end
