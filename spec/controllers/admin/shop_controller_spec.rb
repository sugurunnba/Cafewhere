require 'rails_helper'
RSpec.describe Admin::ShopsController, type: :controller do

  describe "#edit" do
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

  describe "#update" do
    context "送信された値が正しい場合" do
      before do
        @admin = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "リクエストが成功すること" do
        sign_in(@admin)
        patch :update, params: { shop: FactoryBot.attributes_for(:shop,:valid) }
        expect(response.status).to eq 302
      end
      it "ユーザーが登録されること" do
        sign_in(@admin)
        expect do
          patch :update, params: { shop: FactoryBot.attributes_for(:shop,:valid) }
        end.to change(Shop, :count).by(1)
      end
      it "リダイレクトすること" do
        sign_in(@admin)
        patch :update, params: { shop: FactoryBot.attributes_for(:shop,:valid) }
        expect(response).to redirect_to user_user_path(@admin)
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
        patch :update, params: { shop: FactoryBot.attributes_for(:shop) }
        expect(response.status).to eq 200
      end
      it "ユーザーが登録されないこと" do
        sign_in(@admin)
        expect do
          patch :update, params: { shop: FactoryBot.attributes_for(:shop) }
        end.to_not change(Admin, :count)
      end

      # ↓システムテストでも登録リクエストフォームが表示されるかを確認する
      it 'newテンプレートでレスポンスボディーに含まれること' do
        sign_in(@admin)
        patch :update, params: { shop: FactoryBot.attributes_for(:shop) }
        # ↓レンダリングされたものを見たかったが、データ容量が足りずGemをダウンロードできなかったため下記を記載
        expect(response.body).to include "登録リクエストフォーム"
      end

    end
  end

  describe '#destroy' do
    context "ログインしているAdminの場合" do
      before do
        @user = FactoryBot.create(:admin)
        @shop = FactoryBot.create(:shop)
      end
      it "delete" do
        sign_in(@admin)
        delete :destroy, params: {id: @shop.id }
        expect(response).to eq 200


        # @shop = create(:shop)
        # expect{
        #   delete :destroy, id: shop
        # }.to change(Shop,:count).by(-1)
      end
    end
  end

end