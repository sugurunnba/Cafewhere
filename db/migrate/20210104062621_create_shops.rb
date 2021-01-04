class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :introduction
      t.string :shop_image_id
      t.string :address
      t.integer :genre_id
      t.time :business_hours
      t.string :station
      t.string :phone_number
      t.string :home_page
      t.string :holiday

      t.timestamps
    end
  end
end
