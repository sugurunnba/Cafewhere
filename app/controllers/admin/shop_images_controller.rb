class Admin::ShopImagesController < ApplicationController

  def destroy
    shop_image = ShopImage.find_by(id: params[:id], shop_id: params[:shop_id])
    shop_image.destroy
    redirect_to request.referer
  end

end
