class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
    # urlの中にあるid名をparamsでもってくる
    @shop = Shop.find(params[:shop_id])
  end

  def create
    shop = Shop.find(params[:shop_id])
    review = Review.new(review_params)
    review.user = current_user
    review.save!
    redirect_to user_shop_path(shop)
  end

  def index
    # @shops = Shop.all
    # shop_hash = Hash.new
    # @shops.each do |shop|
    #   shop_hash[shop.id] = shop.reviews.average(:rate).to_f.round(1)
    # end

    @shops = Shop.all.sort_by{|shop| shop.reviews.average(:rate).to_f.round(1)}.reverse

    # p shop_hash
  end
=begin
  def index
    @shops = Shop.
    left_joins(:review).
    distinct.
    sort_by do |user|
      hoges = user.comments
      if hoges.present?
        hoges.map(&:score).sum / hoges.size
      else
        0
      end
    end
  reverse
  end
=end


  def show
    @review = Review.find(params[:shop_id])
  end

  def edit
    @review = Review.find(params[:shop_id])
  end

  def update
    shop = Shop.find(params[:id])
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to user_shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to user_shop_path(shop)
  end

  def review_params
    params.require(:review).permit(:title, :body, :rate, :shop_id)
  end
end
