class News < ApplicationRecord

  validates :title, :text, :news_image, presence: true

  attachment :news_image

end
