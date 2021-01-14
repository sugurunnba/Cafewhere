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
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :introduction, :shop_image, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :longitude, :latitude, :shop_image)
  end
end