class Contact < ApplicationRecord

  validates :name, :message, presence: true
  validates :message, length: { maximum: 200 }

end
