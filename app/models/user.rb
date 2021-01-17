class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enumがなくても登録できている、必要か分からないためコメントアウトにしている
  # enum gender: {"男性": 1, "女性": 2}

  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy


  validates :name, :gender, :phone_number, :address, presence: true
  validates :name, :phone_number, :address, uniqueness: true
  validates :phone_number, length: { maximum: 11 }
  validates :introduction, length: { maximum: 100 }


end
