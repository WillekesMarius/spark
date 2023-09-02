class AddLongitudeAndLatitudeToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :longitude, :float
    add_column :favorites, :latitude, :float
  end
end
