class Admin::ShopImagesController < ApplicationController
  def destroy
    @shop_image = ShopImage.find_by(id: params[:id], shop_id: params[:shop_id])
    @shop_image.destroy
    flash[:success] = '写真を削除しました'
    redirect_to request.referer
  end
end
