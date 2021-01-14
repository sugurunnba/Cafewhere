class User::NewesController < ApplicationController
  def index
    @newes = News.all
  end

  def show
    @news = News.find(params[:id])
  end
end
