class Shop < ApplicationRecord

  # :addressを登録した際にgeocoderが緯度、経度のカラムにも自動的に値を入れてくれるようになります。
  # この記述がないとaddressを登録してもlatitude(緯度),longitude(経度)が登録されなくなってしまう(nillになる)ので注意です。
  geocoded_by :address
  after_validation :geocode#, if: :address_changed?
  # after_validation :geocode , if: :address_saved?r
  # validates時は、新規登録と更新しかgeocodeが働かないようにする
  # after_validation :hoge, if: :hoge_false

  # def hoge
  #   puts 'hoge'
  # end

  # def hoge_false
  #   false
  # end


  belongs_to :genre
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy


  attachment :shop_image


  validates :name, :introduction, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :shop_image_id, presence: true
  validates :name, :address, :phone_number, :home_page, uniqueness: true
  validates :introduction, length: { maximum: 200 }
  # 日本一長い駅名が22文字のため
  validates :station, length: { maximum: 22 }
  # 固定電話
  validates :phone_number, length: { maximum: 11 }
  # 11桁以内に修正する


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
