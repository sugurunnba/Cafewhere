require 'rails_helper'

RSpec.describe User::ShopsController, type: :controller do
  describe "#new" do
    context "ログインしているUserの場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "投稿ページは正常なレスポンスをしているか" do
        sign_in(@user)
        get :new
        expect(response).to be_success
      end
      it "200レスポンス(成功レスポンス)は返って来ているか" do
        sign_in(@user)
        get :new
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしていないUserの場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "投稿ページは正常なレスポンスをしているか" do
        get :new
        expect(response).not_to be_success
      end
      it "302レスポンス(失敗レスポンス)は返って来ているか" do
        get :new
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか?" do
        get :new
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#index" do
    context "ログインしているUserの場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "一覧ページは正常なレスポンスをしているか" do
        sign_in(@user)
        get :index
        expect(response). to be_success
      end
      it "200レスポンス(成功レスポンス)は返って来ているか" do
        sign_in(@user)
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしていないゲストユーザの場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "正常にレスポンスが返ってきていないか" do
        get :index
        expect(response).not_to be_success
      end
      it "302レスポンス(失敗レスポンス)は返って来ているか" do
        get :index
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか？" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#show" do
    context "ログインしているUserの場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "詳細ページは正常なレスポンスをしているか" do
        sign_in(@user)
        get :show, params: { id: @shop.id }
        expect(response).to be_success
      end
      it "200レスポンス(成功レスポンス)は返って来ているか" do
        sign_in @user
        get :show, params: { id: @shop.id }
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしていないゲストユーザの場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "正常にレスポンスが返ってきていないか" do
        get :show, params: { id: @shop.id }
        expect(response).not_to be_success
      end
      it "302レスポンス(失敗レスポンス)は返って来ているか" do
        get :show, params: { id: @shop.id }
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか？" do
        get :show, params: { id: @shop.id }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#create" do
    context "パラメータが妥当な場合" do
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "リクエストが成功すること" do
        sign_in(@user)
        post :create, params: { shop: FactoryBot.attributes_for(:shop, :valid) }
        expect(response.status).to eq 302
      end
      it "ユーザーが登録されること" do
        sign_in(@user)
        expect do
          post :create, params: { shop: FactoryBot.attributes_for(:shop, :valid) }
        end.to change(Shop, :count).by(1)
      end
      it "リダイレクトすること" do
        sign_in(@user)
        post :create, params: { shop: FactoryBot.attributes_for(:shop, :valid) }
        expect(response).to redirect_to user_user_path(@user)
      end
    end

    context "パラメータが不正な場合" do
      render_views
      # ↑標準ではレンダリングしないところ、この記述のおかげでビューをレンダリングさせることができる
      before do
        @user = FactoryBot.create(:user)
        @shop = FactoryBot.create(:shop)
      end

      it "リクエストが成功すること" do
        sign_in(@user)
        post :create, params: { shop: FactoryBot.attributes_for(:shop) }
        expect(response.status).to eq 200
      end
      it "ユーザーが登録されないこと" do
        sign_in(@user)
        expect do
          post :create, params: { shop: FactoryBot.attributes_for(:shop) }
        end.not_to change(User, :count)
      end

      # ↓システムテストでも登録リクエストフォームが表示されるかを確認する
      it 'newテンプレートでレスポンスボディーに含まれること' do
        sign_in(@user)
        post :create, params: { shop: FactoryBot.attributes_for(:shop) }
        # ↓レンダリングされたものを見たかったが、データ容量が足りずGemをダウンロードできなかったため下記を記載
        expect(response.body).to include "登録リクエストフォーム"
      end

      # ↓システムテストへ移行
      # it 'エラーが表示されること' do
      #   sign_in(@user)
      #   post :create, params: { shop: FactoryBot.attributes_for(:shop, :invalid) }
      #   expect(assigns(:user).errors.any?).to be_truthy
      # end
    end
  end
end
