require 'rails_helper'
RSpec.describe 'reviewモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:review) { FactoryBot.create(:review) }
    it 'titleが空だとNG' do
      review.title = ''
      expect(review.valid?).to be false
    end
    it 'bodyが空だとNG' do
      review.body = ''
      expect(review.valid?).to be false
    end
    it 'rateが空だとNG' do
      review.rate = ''
      expect(review.valid?).to be false
    end
    it 'titleが21文字以上だとNG' do
      review.title = Faker::Lorem.characters(number: 21)
      expect(review.valid?).to be false
    end
    it 'bodyが101文字以上だとNG' do
      review.body = Faker::Lorem.characters(number: 101)
      expect(review.valid?).to be false
    end
  end
end
