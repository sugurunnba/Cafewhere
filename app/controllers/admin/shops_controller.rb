class Admin::ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @shops = Shop.all
    @genres = Genre.all
  end

  def index
    @shop = Shop.new
    @shops = Shop.all
    @genres = Genre.all
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shops_path
    else
      flash[:alert] = "メッセージを入力してください。または重複したデータは登録できません。"
      render action: :index
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
    @genres = Genre.all
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to admin_shops_path
    else
      flash[:alert] = "メッセージを入力してください。または重複したデータは登録できません。"
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to admin_shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :introduction, :shop_image, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :longitude, :latitude, :is_active)
  end
end
