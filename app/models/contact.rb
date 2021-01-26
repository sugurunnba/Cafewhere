class Contact < ApplicationRecord
  
  validates :name, :email, :title, :message, presence: true
  validates :message, length: { maximum: 200 }
  
end
