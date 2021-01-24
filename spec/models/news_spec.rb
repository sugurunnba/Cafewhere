require 'rails_helper'
RSpec.describe 'Newsモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:news) { FactoryBot.create(:news) }

    it 'titleが空だとNG' do
      news.title = ''
      expect(news.valid?).to be false
    end
    it 'textが空だとNG' do
      news.text = ''
      expect(news.valid?).to be false
    end
    it 'news_imageが空だとNG' do
      news.news_image_id = ''
      expect(news.valid?).to be false
    end
  end
end