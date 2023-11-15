class RemoveDurationFlagFromPromotions < ActiveRecord::Migration[5.2]
  def change
    remove_column :promotions, :duration_flag, :string
  end
end
