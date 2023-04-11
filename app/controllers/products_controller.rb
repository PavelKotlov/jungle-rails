class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @sales = Sale.active[0]
  end

  def show
    @product = Product.find params[:id]
    @sales = Sale.active[0]
  end

end
