require 'rails_helper'

RSpec.describe Admin::ShopsController, type: :controller do
  describe "newアクション" do
    context "ログインしているAdminの場合" do

      before do
        @admin = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "投稿ページはログインしているレスポンスをしているか" do
        sign_in(@admin)
        get :new
        expect(response).to be_success
      end
      it "200レスポンス(成功レスポンス)は返って来ているか" do
        sign_in(@admin)
        get :new
        expect(response).to have_http_status "200"
      end

    end
  end

end