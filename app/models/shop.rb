class Shop < ApplicationRecord

  # :addressを登録した際にgeocoderが緯度、経度のカラムにも自動的に値を入れてくれるようになります。
  # この記述がないとaddressを登録してもlatitude(緯度),longitude(経度)が登録されなくなってしまう(nillになる)ので注意です。
  geocoded_by :address
  after_validation :geocode#, if: :address_changed?
  # after_validation :geocode , if: :address_saved?r
  # validate時は、新規登録と更新しかgeocodeが働かないようにする
  # after_validation :hoge, if: :hoge_false

  # def hoge
  #   puts 'hoge'
  # end

  # def hoge_false
  #   false
  # end

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
