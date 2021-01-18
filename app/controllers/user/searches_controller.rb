class User::SearchesController < ApplicationController
  def placegenre
    @genres = Genre.all
  end

  def index
    @shops = Shop.search(params[:search], params[:select])
  end
end
