class Admin::ShopsController < ApplicationController
  def index
    @shop = Shop.new
    @shops = Shop.all
    @genres = Genre.all
  end

  def create
    shop = Shop.new(shop_params)
    shop.save
    redirect_to admin_shops_path
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
    @genres = Genre.all
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to admin_shops_path
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to admin_shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :introduction, :shop_image, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :longitude, :latitude)
  end
end
