class AddAdvertiserToPromotions < ActiveRecord::Migration[5.2]
  def change
    add_reference :promotions, :advertiser, index: true, foreign_key: true
  end
end
