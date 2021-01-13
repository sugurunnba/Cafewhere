FactoryBot.define do
  factory :shop do
    association :genre
    name { Faker::Lorem.characters(number:20) }
    introduction { Faker::Lorem.characters(number:20) }
    shop_image_id { 1 }
    address { Faker::Lorem.characters(number:20) }
    start_business_hours { Time.parse('2020-01-01 12:00:00') }
    station { Faker::Lorem.characters(number:22) }
    phone_number { Faker::Lorem.characters(number:11) }
    home_page { Faker::Lorem.characters(number:22) }
    holiday { '月曜日' }
    finish_business_hours { Time.parse('2020-01-01 12:00:00') }
    latitude { 1.1 }
    longitude { 1.2 }
  end
end
