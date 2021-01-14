class Admin::NewsesController < ApplicationController

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @news.save
    redirect_to admin_newses_path
  end

  def index
    @newses = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    @news.update(news_params)
    redirect_to admin_newses_path
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to admin_newses_path
  end

  private
  def news_params
    params.require(:news).permit(:title, :text, :news_image)
  end

end
