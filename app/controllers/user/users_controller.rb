class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
    @users = User.all
    @shops = Shop.all
    @reviews = Review.all
  end

  def about
  end

  def show
    @user = User.find(params[:id])
  end

  # 退会確認画面
  def quit
  end

  # 退会データを送信する
  def out
    @user = current_user
    # user_status(退会済みかを確認するカラム)をtrueに変更する(デフォルトはfalse)
    @user.update(user_status: true)
    # 退会するとログインできないようにするため、セッション情報を削除する
    reset_session
    flash[:success] = '退会が完了いたしました。ぜひまた遊びに来てください！'
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :gender, :phone_number, :address)
  end
end
