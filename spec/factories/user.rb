FactoryBot.define do
  factory :user do
    name { '太郎' }
    email { Faker::Internet.email }
    phone_number { 12345678909 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end