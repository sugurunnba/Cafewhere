class Bookmark < ApplicationRecord
  # references型で設定したことにより自動で追加された
  belongs_to :user
  belongs_to :shop
  
  
end
