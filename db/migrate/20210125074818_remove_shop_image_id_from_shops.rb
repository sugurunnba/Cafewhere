class RemoveShopImageIdFromShops < ActiveRecord::Migration[5.2]
  def up
    remove_column :shops, :shop_image_id
  end

  def down
    add_column :shops, :shop_image_id, :string
  end
end
