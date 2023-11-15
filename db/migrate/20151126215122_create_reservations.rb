class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :promotion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
