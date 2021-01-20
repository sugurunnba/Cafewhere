class Admin::ShopsController < ApplicationController
  def delete
    @shops = Shop.all
  end

  def new
    @shops = Shop.all
    @genres = Genre.all
  end

  def index
    @shop = Shop.new
    @shops = Shop.all
    @genres = Genre.all
  end

  # def create
  #   @shop = Shop.new(shop_params)
  #   if @shop.save
  #     redirect_to admin_shops_path
  #   else
  #     flash[:alert] = "メッセージを入力してください。または重複したデータは登録できません。"
  #     render action: :index
  #   end
  # end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
    @genres = Genre.all
  end

  def update
    @shop = Shop.find(params[:id])
    @genres = Genre.all
    if @shop.update(shop_params)
      flash[:success] = "カフェのデータを更新しました"
      redirect_to admin_shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    flash[:success] = "カフェのデータを削除しました"
    redirect_to admin_shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :introduction, :shop_image, :address, :genre_id, :start_business_hours, :finish_business_hours, :station, :phone_number, :home_page, :holiday, :longitude, :latitude, :is_active)
  end
end
