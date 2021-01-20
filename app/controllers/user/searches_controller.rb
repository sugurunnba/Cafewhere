class User::SearchesController < ApplicationController
  def placegenre
    @genres = Genre.all
  end

  def index
    select = Shop.distinguish_select(params)
    @shops = Shop.search(params[:search], select, params[:genre]).page(params[:page])
  end
end
