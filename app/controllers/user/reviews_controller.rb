class User::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    # urlの中にあるid名をparamsでもってくる
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.shop_id = @shop.id
    if @review.save
      redirect_to user_shop_path(@shop)
      flash[:success] = '評価頂きありがとうございます！'
    else
      flash[:notice] = '必須箇所を入力ください'
      render :new
    end
  end

  def index
    # @shops = Shop.all
    # shop_hash = Hash.new
    # @shops.each do |shop|
    #   shop_hash[shop.id] = shop.reviews.average(:rate).to_f.round(1)
    # end

    # 理解できていない
    # @shops = Shop.all.sort_by{|shop| shop.reviews.average(:rate).to_f.round(1)}.reverse
    @shops = Shop.page(params[:page])
    @shopss = @shops.sort_by { |shop| shop.reviews.average(:rate).to_f.round(1) }.reverse
    # p shop_hash
  end
  #   def index
  #     @shops = Shop.
  #     left_joins(:review).
  #     distinct.
  #     sort_by do |user|
  #       hoges = user.comments
  #       if hoges.present?
  #         hoges.map(&:score).sum / hoges.size
  #       else
  #         0
  #       end
  #     end
  #   reverse
  #   end

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
