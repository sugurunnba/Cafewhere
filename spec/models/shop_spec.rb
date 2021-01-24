require 'rails_helper'
RSpec.describe 'Shopモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # let(:user) { FactoryBot.create(:user) }
    let!(:other_shop) { FactoryBot.create(:shop) }
    let(:shop) { FactoryBot.create(:shop) }
    # it 'emailが空だとNG' do
    #   shop.email = ''
    #   expect(shop.valid?).to be false
    # end
    it 'nameが空だとNG' do
      shop.name = ''
      expect(shop.valid?).to be false
    end
    it 'introductionが空だとNG' do
      shop.introduction = ''
      expect(shop.valid?).to be false
    end
    it 'addressが空だとNG' do
      shop.address = ''
      expect(shop.valid?).to be false
    end
    it 'genre_idが空だとNG' do
      shop.genre_id = ''
      expect(shop.valid?).to be false
    end
    it 'phone_numberが空だとNG' do
      shop.phone_number = ''
      expect(shop.valid?).to be false
    end
    it 'stationが空だとNG' do
      shop.station = ''
      expect(shop.valid?).to be false
    end
    it 'home_pageが空だとNG' do
      shop.home_page = ''
      expect(shop.valid?).to be false
    end
    it 'holidayが空だとNG' do
      shop.holiday = ''
      expect(shop.valid?).to be false
    end
    it 'nameが重複していればNG' do
      # ↓ターミナルに変数の中身を表示
      # print("@@@:#{other_shop.name}")
      shop.name =other_shop.name
      # print("###:#{shop.name}")
      expect(shop.valid?).to be false
    end
    it 'addressが重複していればNG' do
      shop.address = other_shop.address
      expect(shop.valid?).to be false
    end
    it 'phone_numberが重複していればNG' do
      shop.phone_number = other_shop.phone_number
      expect(shop.valid?).to be false
    end
    it 'introductionが201文字以上だとNG' do
      shop.introduction = Faker::Lorem.characters(number: 201)
      expect(shop.valid?).to be false
    end
    it 'stationが23文字以上だとNG' do
      shop.station = Faker::Lorem.characters(number: 23)
      expect(shop.valid?).to be false
    end
    it 'phone_numberが12文字以上だとNG' do
      shop.phone_number = Faker::Lorem.characters(number: 12)
      expect(shop.valid?).to be false
    end
    it 'phone_numberが整数だとNG' do
      shop.phone_number = Faker::Lorem.characters(number: 12).to_s
      expect(shop.valid?).to be false
    end
  end
end
