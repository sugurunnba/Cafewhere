require 'rails_helper'
RSpec.describe Admin::ShopsController, type: :controller do

  describe "editアクション" do
    context "ログインしているadminの場合" do
      before do
        @admin = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "編集ページは正常なレスポンスをしているか" do
        sign_in @admin
        get :edit, params: {id: @shop.id}
        expect(response).to be_success
      end
      it "200レスポンス(成功レスポンス)は返って来ているか" do
        sign_in @admin
        get :edit, params: {id: @shop.id}
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていないゲストユーザの場合" do
      before do
        @admin = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "正常にレスポンスが返ってきていないか" do
        get :edit, params: {id: @shop.id}
        expect(response).to_not be_success
      end
      it "302レスポンス(失敗レスポンス)は返って来ているか" do
        get :edit, params: {id: @shop.id}
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか" do
        get :edit, params: {id: @shop.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end

  describe "updateアクション" do
    context "送信された値が正しい場合" do
      before do
        @admin = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "リクエストが成功すること" do
        sign_in(@admin)
        patch :update, params:{ id: @shop.id, shop: FactoryBot.attributes_for(:shop,:valid) }
        expect(response.status).to eq 302
      end
      it "リダイレクトすること" do
        sign_in(@admin)
        patch :update, params: { id: @shop.id, shop: FactoryBot.attributes_for(:shop,:valid) }
        expect(response).to redirect_to new_admin_shop_path
      end
    end

    context "送信された値が間違っている場合" do
      render_views
      # ↑標準ではレンダリングしないところ、この記述のおかげでビューをレンダリングさせることができる
      before do
        @admin = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "リクエストが成功すること" do
        sign_in(@admin)
        patch :update, params: { id: @shop.id, shop: FactoryBot.attributes_for(:shop) }
        expect(response.status).to eq 302
      end
      it "ユーザーが登録されないこと" do
        sign_in(@admin)
        expect do
          patch :update, params: { id: @shop.id, shop: FactoryBot.attributes_for(:shop) }
        end.to_not change(Admin, :count)
      end
    end
  end
end