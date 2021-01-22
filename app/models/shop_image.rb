class ShopImage < ApplicationRecord
  belongs_to :shop
  attachment :shop_image
end
