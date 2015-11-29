class AddUuidToReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :id
    add_column :reservations, :id, :uuid, default: 'uuid_generate_v4()'
    execute 'ALTER TABLE reservations ADD PRIMARY KEY (id)'
  end
end
