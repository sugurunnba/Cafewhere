class ChangeDatatypeIsActiveOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :is_active, :integer
  end
end
