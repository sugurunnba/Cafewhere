require 'rails_helper'

RSpec.describe User::UsersController, type: :controller do
  describe "showアクション" do
    context "ログインをしているUserの場合" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "詳細ページは正常なレスポンスをしているか" do
        sign_in(@user)
        get :show, params: { id: @user.id }
        expect(response).to be_success
      end
      it "200レスポンス(成功レスポンス)が返って来ているか" do
        sign_in(@user)
        get :show, params: { id: @user.id }
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしていないUserの場合" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常にレスポンスが返ってきていないか" do
        get :edit, params: { id: @user.id }
        expect(response).not_to be_success
      end
      it "302レスポンス(失敗レスポンス)は返って来ているか" do
        get :edit, params: { id: @user.id }
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか" do
        get :edit, params: { id: @user.id }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "editアクション" do
    context "ログインしているUserの場合" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常にレスポンスが返って来ているか" do
        sign_in(@user)
        get :edit, params: { id: @user.id }
        expect(response).to be_success
      end
      it "成功レスポンス(200レスポンス)が返って来ているか" do
        sign_in(@user)
        get :edit, params: { id: @user.id }
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしていないUserの場合" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常なレスポンスをしていないかどうか" do
        get :edit, params: { id: @user.id }
        expect(response).not_to be_success
      end
      it "302レスポンス(失敗レスポンス)を返しているかどうか" do
        get :edit, params: { id: @user.id }
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトしているか" do
        get :edit, params: { id: @user.id }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
