class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.string :description
      t.string :banner_url
      t.date :date_of_creation
      t.date :end_date
      t.string :duration_flag
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
