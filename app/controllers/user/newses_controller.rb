class User::NewsesController < ApplicationController

  def index
    @newses = News.page(params[:page])
  end

  def show
    @news = News.find(params[:id])
  end

end
