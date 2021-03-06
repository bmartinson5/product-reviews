class ReviewsController < ApplicationController

  def index
    @reviews = nil
    @filter_review = Review.new
    if params.key?(:review)
      search_author = params[:review][:author]
      search_rating = params[:review][:rating]
      @reviews = Review.filter_by(search_author, search_rating)
    else
      @reviews = Review.all
    end
    render :index
  end


  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Review Saved!"
      user_review = current_user.reviews.new(review_params)
      user_review.save
      redirect_to product_path(id: params[:product_id])
    else
      flash[:alert] = "Review not Saved!"
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:author, :rating, :content_body)
    end


end
