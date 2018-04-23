class ProductsController < ApplicationController
  # TODO: BUILD OUT HOMEPAGE VIEW FOR WHOLE SITE
  def homepage;end

  def index
    @products = Product.all

    # TODO: ADD AS MANY CATEGORY FILTERS AS WINI DEVELOPS
  end

  def show
    @product = Product.find_by(id: params[:id])
    head :not_found unless @product

    @cartitem = Cartitem.new
    @review = Review.new
  end
end
