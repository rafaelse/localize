class RenameAdvertiserCoordinates < ActiveRecord::Migration
  def change
    rename_column :advertisers, :latitude, :lat
    rename_column :advertisers, :longitude, :lng
  end
end
