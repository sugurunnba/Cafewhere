class Admin::ShopsController < ApplicationController
  def index
    @shop = Shop.new
    @shops = Shop.all
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
    params.require(:shop).permit(:name, :introduction, :shop_image, :address, :genre, :business_hours, :station, :phone_number, :holiday)
  end
end
