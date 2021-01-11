class User::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to admin_shop_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :introduction, :shop_image, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :longitude, :latitude)
  end
end