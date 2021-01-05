class User::SearchesController < ApplicationController
  def index
    @shops = Shop.search(params[:search], params[:select])
  end
end
