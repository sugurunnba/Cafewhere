class User::ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @genres = Genre.all
  end

  def create
    @shop = Shop.new(shop_params)
    @genres = Genre.all
    if @shop.save
      flash[:success] = "リクエスト頂きありがとうございます！"
      redirect_to user_user_path(current_user)
    else
      render :new
    end
  end

  def index
    @shops = Shop.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private
  def shop_params
    params.require(:shop).permit(:shop_image, :name, :introduction, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :longitude, :latitude)
  end
end