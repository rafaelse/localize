class RemoveDurationFlagFromPromotions < ActiveRecord::Migration
  def change
    remove_column :promotions, :duration_flag, :string
  end
end
