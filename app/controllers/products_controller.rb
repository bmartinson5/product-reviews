class ProductsController < ApplicationController
  def index
    @products = Product.all
    @most_reviewed = Product.most_reviewed
    @local_products = Product.local_products
    @recently_added = Product.recently_added
    render :index
  end

  def new
    @product = Product.new()
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product Saved!"
      redirect_to products_path
    else
      flash[:alert] = "Product not Saved!"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @avg_rating = @product.calc_avg_rating();
    render :show
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
    binding.pry
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end
