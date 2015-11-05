class AddPriceToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :price, :decimal
  end
end
