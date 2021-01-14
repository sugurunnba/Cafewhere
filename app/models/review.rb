class Review < ApplicationRecord

  belongs_to :user
  belongs_to :shop

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  validates :title, :body, :rate, presence: true
  validates :title, length: { maximum: 20 }
  validates :body, length: { maximum: 100 }

end
