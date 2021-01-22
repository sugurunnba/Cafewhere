FactoryBot.define do
  factory :review do
    association :user
    association :shop
    # (メモ)↑これらの意味は？
    title { Faker::Lorem.characters(number: 20) }
    body { Faker::Lorem.characters(number: 100) }
    rate { 1.1 }
    review_image_id { 1 }
  end
end
