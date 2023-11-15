class AddPriceToPromotions < ActiveRecord::Migration[5.2]
  def change
    add_column :promotions, :price, :decimal
  end
end
