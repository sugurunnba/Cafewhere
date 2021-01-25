require 'rails_helper'

RSpec.describe Admin::ShopsController, type: :controller do
  describe "newアクション" do
    context "ログインしているUserの場合" do
    
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end
      it "投稿ページはログインしているレスポンスをしているか" do
        sign_in(@user)
        get :new
        expect(response).to be_success
      end
      it "200レスポンス(成功レスポンス)は返って来ているか" do
        sign_in(@user)
        get 
      end
    
    end
  end
  
end