class Admin::SalesController < ApplicationController
  before_action :authorize
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  def index
    @sales = Sale.all
  end

  def new
    @sales = Sale.new
  end

  def create
    @sales = Sale.new(sale_params)

    if @sales.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end

  def destroy
    @sales = Sale.find params[:id]
    @sales.destroy
    redirect_to [:admin, :sales], notice: 'Sale deleted!'
  end

  private

  def sale_params
    params.require(:sale).permit(
      :name,
      :starts_on,
      :ends_on,
      :percent_off,
    )
  end
end
