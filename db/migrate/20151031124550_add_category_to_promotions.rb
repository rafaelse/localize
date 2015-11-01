class AddCategoryToPromotions < ActiveRecord::Migration
  def change
    add_reference :promotions, :category, index: true, foreign_key: true
  end
end
