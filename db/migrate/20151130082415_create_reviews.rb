class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :reservation, index: true, foreign_key: true
      t.string :text
      t.integer :rating

      t.timestamps null: false
    end
  end
end
