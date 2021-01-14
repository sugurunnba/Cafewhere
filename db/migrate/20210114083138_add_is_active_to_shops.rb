class AddIsActiveToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :is_active, :boolean
  end
end
