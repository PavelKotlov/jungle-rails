class Admin::DashboardController < ApplicationController
  
  before_action :authorize
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  def show
    @products = Product.all
    @categories = Category.all
  end
  
end
