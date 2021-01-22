class Genre < ApplicationRecord
  has_many :shops

  validates :name, presence: true
  validates :name, length: { maximum: 15 }
end
