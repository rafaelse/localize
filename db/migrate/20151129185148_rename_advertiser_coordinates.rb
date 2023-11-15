class RenameAdvertiserCoordinates < ActiveRecord::Migration[5.2]
  def change
    rename_column :advertisers, :latitude, :lat
    rename_column :advertisers, :longitude, :lng
  end
end
