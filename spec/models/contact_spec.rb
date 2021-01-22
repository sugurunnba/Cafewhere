require 'rails_helper'
RSpec.describe 'contactモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:contact) { FactoryBot.create(:contact) }
    it 'nameが空だとNG' do
      contact.name = ''
      expect(contact.valid?).to be false
    end
    it 'messageが空だとNG' do
      contact.message = ''
      expect(contact.valid?).to be false
    end
    it 'messageが201文字以上だとNG' do
      contact.message = Faker::Lorem.characters(number: 201)
      expect(contact.valid?).to be false
    end
  end
end
