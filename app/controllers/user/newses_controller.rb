class User::NewsesController < ApplicationController
  before_action :authenticate_user!

  def index
    @newses = News.page(params[:page]).reverse_order
  end

  def show
    @news = News.find(params[:id])
  end
end
