class ReviewsController < ApplicationController

  def index
    if current_user
      @reviews = Review.where(user_id: current_user.id)
    end
    render :index
  end


  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    byebug
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
