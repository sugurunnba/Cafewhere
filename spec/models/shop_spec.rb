require 'rails_helper'
RSpec.describe 'Shopモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # let(:user) { FactoryBot.create(:user) }
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
    it 'shop_image_idが空だとNG' do
      shop.shop_image_id = ''
      expect(shop.valid?).to be false
    end
    it 'start_business_hoursが空だとNG' do
      shop.start_business_hours = ''
      expect(shop.valid?).to be false
    end
    it 'finish_business_hoursが空だとNG' do
      shop.finish_business_hours = ''
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
  end
end
