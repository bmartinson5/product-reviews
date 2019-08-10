class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:id])
    @review = @Product.reviews.new
    render :new
  end

  
end
