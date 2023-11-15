class AddUuidToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :code, :uuid, default: 'uuid_generate_v4()'
  end
end
