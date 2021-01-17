FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "太郎#{n}" }
    # sequence(:name) do |n|
    #   "太郎#{n}"
    # end
    email { Faker::Internet.email }
    phone_number { format("090%0#{8}d", SecureRandom.random_number(8**8)) }
    # SecureRandom.random_number　引数のダンダムで数字を表示
    # format 第2引数で渡された文字列を、第一引数の形式で表示する
    # 正規表現

    # phone_number { Faker::PhoneNumber.cell_phone.to_i }
    # Fakerでランダムに作る電話番号が同じだとエラーが発生してしまう
    sequence(:address) {|n| "藤井寺市#{n}" }
    introduction { Faker::Lorem.characters(number:100) }
    gender { 1 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end




