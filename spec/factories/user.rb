FactoryBot.define do
  factory :user do
    name { '太郎' }
    email { Faker::Internet.email }
    phone_number { 12345678901 }
    address { '藤井寺市' }
    introduction { Faker::Lorem.characters(number:100) }
    gender { 1 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end