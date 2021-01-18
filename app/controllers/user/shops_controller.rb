class User::ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @genres = Genre.all
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save!
    redirect_to request.referer
  end

  def index
    @shops = Shop.all
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