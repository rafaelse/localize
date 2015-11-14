class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :active
      t.string :address
      t.string :city
      t.string :estate
      t.string :country
      t.string :zip_code
      t.decimal :latitude
      t.decimal :longitude
      t.string :type

      t.timestamps null: false
    end
  end
end
