class AddBannerToPromotions < ActiveRecord::Migration
  def up
    remove_column :promotions, :banner_url, :string
    add_attachment :promotions, :banner
  end
  
  def down
    add_column :promotions, :banner_url, :string
    remove_attachment :promotions, :banner
  end
end
