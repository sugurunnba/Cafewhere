class ChangeDatatypeLatitudeOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :latitude, :float
  end
end
