FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "太郎#{n}" }
    # sequence(:name) do |n|
    #   "太郎#{n}"
    # end
    email { Faker::Internet.email }
    # SecureRandom.random_number　引数のダンダムで数字を表示
    # format 第2引数で渡された文字列を、第一引数の形式で表示する
    # 正規表現

    # phone_number { Faker::PhoneNumber.cell_phone.to_i }
    # Fakerでランダムに作る電話番号が同じだとエラーが発生してしまう
    introduction { Faker::Lorem.characters(number: 100) }
    gender { 1 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
