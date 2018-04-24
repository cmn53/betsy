class ProductsController < ApplicationController
  # TODO: BUILD OUT HOMEPAGE VIEW FOR WHOLE SITE
  def homepage;end

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @product = Product.find_by(id: params[:id])
    head :not_found unless @product

    @cartitem = Cartitem.new
    @review = Review.new
  end
end
