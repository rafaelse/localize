class AddUuidToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :code, :uuid, default: 'uuid_generate_v4()'
  end
end
