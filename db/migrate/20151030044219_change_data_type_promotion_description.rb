class ChangeDataTypePromotionDescription < ActiveRecord::Migration
  def up
   change_table :promotions do |t|
    t.change :description, :text
   end
  end

  def down
    change_table :promotions do |t|
     t.change :description, :string
    end
  end
end
