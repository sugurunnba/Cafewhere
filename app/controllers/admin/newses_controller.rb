class Admin::NewsesController < ApplicationController
  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to admin_newses_path
      flash[:success] = 'お知らせを投稿しました'
    else
      render :new
    end
  end

  def index
    @newses = News.page(params[:page]).reverse_order
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      flash[:success] = 'お知らせを更新しました'
      redirect_to admin_newse_path(@news)
    else
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    flash[:success] = 'お知らせを削除しました'
    redirect_to admin_newses_path
  end

  private

  def news_params
    params.require(:news).permit(:title, :text, :news_image)
  end
end
