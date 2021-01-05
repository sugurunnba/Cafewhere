class User::ShopsController < ApplicationController
  def index
    @shops = Shop.all
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
    redirect_to admin_shop_path
  end

end