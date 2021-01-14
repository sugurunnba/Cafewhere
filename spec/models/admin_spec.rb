require 'rails_helper.rb'
RSpec.describe 'adminモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:admin) { FactoryBot.create(:admin) }
    it 'nameが空だとNG' do
      admin.name = ''
      expect(admin.valid?).to be false
    end
    it 'emailが空だとNG' do
      admin.email = ''
      expect(admin.valid?).to be false
    end
    it 'passwordが空だとNG' do
      admin.password = ''
      expect(admin.valid?).to be false
    end
  end
end