class ProductsController < ApplicationController

  def index
  end

  def new
    @products = TblProduct.new
  end
  
  def create
  end

end
