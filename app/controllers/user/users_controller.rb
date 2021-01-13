class User::UsersController < ApplicationController
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

  # 退会データを送信するメソッド
  def out
    @user = current_user
    @user.update(user_status: true)
    reset_session
    flash[:notice] = "退会が完了いたしました。"
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :introduction, :gender, :phone_number, :address)
  end

end
