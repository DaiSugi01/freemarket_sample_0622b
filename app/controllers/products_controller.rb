class ProductsController < ApplicationController

  def index
  end

  def new
    @product = TblProduct.new
  end
  
  def create
    TblProduct.create(product_params)
      redirect_to root_path
  end

  private
  def product_params
    params.require(:tbl_product).permit(:name, :description, :price)
  end
end
