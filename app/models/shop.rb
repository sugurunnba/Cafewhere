class Shop < ApplicationRecord

  attachment :shop_image

  belongs_to :genre
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def self.search(search, select)
    if  select == "habikino"
      Shop.where(["address LIKE ?", "%羽曳野市%"])
    elsif select == "fujidera"
      Shop.where(["address LIKE ?", "%藤井寺市%"])
    elsif select == "higashiosaka"
      Shop.where(["address LIKE ?", "%東大阪市%"])
    else
      Shop.where(["name LIKE ?", "%#{search}%"])
    end
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
