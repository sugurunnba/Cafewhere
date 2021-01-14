class User::NewsesController < ApplicationController

  def index
    @newses = News.all
  end

  def show
    @news = News.find(params[:id])
  end

end
