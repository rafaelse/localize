class AddCategoryToPromotions < ActiveRecord::Migration[5.2]
  def change
    add_reference :promotions, :category, index: true, foreign_key: true
  end
end
