class AddAdvertiserToPromotions < ActiveRecord::Migration
  def change
    add_reference :promotions, :advertiser, index: true, foreign_key: true
  end
end
