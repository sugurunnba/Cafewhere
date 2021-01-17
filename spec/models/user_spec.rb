require 'rails_helper'
RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # let(:user) { FactoryBot.create(:user) }
    let!(:other_user) { FactoryBot.create(:user) }
    let(:user) { FactoryBot.create(:user) }
    # it 'emailが空だとNG' do
    #   user.email = ''
    #   expect(user.valid?).to be false
    # end
    it 'nameが空だとNG' do
      user.name = ''
      expect(user.valid?).to be false
    end
    it 'addressが空だとNG' do
      user.address = ''
      expect(user.valid?).to be false
    end
    it 'genderが空だとNG' do
      user.gender = ''
      expect(user.valid?).to be false
    end
    it 'phone_numberが空だとNG' do
      user.phone_number = ''
      expect(user.valid?).to be false
    end
    it '一意性があること' do
      user.name = other_user.name
      expect(user.valid?).to be false
    end
    it 'introductionが101文字以上だとNG' do
      user.introduction = Faker::Lorem.characters(number:101)
      expect(user.valid?).to be false
    end
    it 'phone_numberが12文字以上だとNG' do
      user.phone_number = Faker::Lorem.characters(number:12)
      expect(user.valid?).to be false
    end
  end
end