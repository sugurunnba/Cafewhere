class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def placegenre
    @genres = Genre.all
  end

  def index
    select = Shop.distinguish_select(params)
    @shops = if params[:search].present?
               Shop.where(['name LIKE ?', "%#{params[:search]}%"]).page(params[:page])
             else
               Shop.search(select, params[:genre]).page(params[:page])
             end
  end
end
