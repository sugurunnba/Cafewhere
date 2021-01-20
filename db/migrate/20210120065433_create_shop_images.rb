class CreateShopImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_images do |t|
      t.string :shop_image_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
