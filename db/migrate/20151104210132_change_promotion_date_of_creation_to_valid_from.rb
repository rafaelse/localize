class ChangePromotionDateOfCreationToValidFrom < ActiveRecord::Migration[5.2]
  def change
    rename_column :promotions, :date_of_creation, :valid_from
    rename_column :promotions, :end_date, :valid_to
  end
end
