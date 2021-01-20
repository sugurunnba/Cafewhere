class User::SearchesController < ApplicationController
  def placegenre
    @genres = Genre.all
  end

  def index
    select = Shop.distinguish_select(params)
    if params[:search].present?
      @shops = Shop.where(["name LIKE ?", "%#{params[:search]}%"]).page(params[:page])
    else
      @shops = Shop.search(params[:search], select, params[:genre]).page(params[:page])
    end
  end
end
