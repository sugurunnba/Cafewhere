class User::BookmarksController < ApplicationController

  def show
    @bookmarks = Bookmark.where(user_id: current_user.id).page(params[:page])
  end

  def create
    shop = Shop.find(params[:shop_id])
    bookmark = Bookmark.new(user_id: current_user.id, shop_id: shop.id)
    # 保存がうまくいかない時はsaveの後ろに！をつけることで、何が足りないかをエラーで教えてくれる
    bookmark.save
    flash[:success] = "ブックマークしました"
    redirect_to request.referer
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    bookmark = shop.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
    flash[:success] = "ブックマークを外しました"
    redirect_to request.referer
  end

end
