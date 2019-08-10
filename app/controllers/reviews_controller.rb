class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(id: params[:product_id])
    else
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:author, :rating, :content_body)
    end


end
