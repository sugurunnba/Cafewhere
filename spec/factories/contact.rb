FactoryBot.define do
  factory :contact do
    name { '太郎' }
    message { Faker::Lorem.characters(number:200) }
  end
end