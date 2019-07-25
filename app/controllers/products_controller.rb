class ProductsController < ApplicationController

  def index

    # レディース
    @ladies_products = TblProduct.get_items(1)
    # メンズ
    @mens_products = TblProduct.get_items(2)
    # ベビー・キッズ
    @kids_products = TblProduct.get_items(3)
    # コスメ・香水・美容
    @cosmes_products = TblProduct.get_items(4)
    # シャネル
    @chanel_products = TblProduct.get_blands(1)
    # ルイ ヴィトン
    @vuitton_products = TblProduct.get_blands(2)
    # シュプリーム
    @supreme_products = TblProduct.get_blands(3)
    # ナイキ
    @nike_products = TblProduct.get_blands(4)
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
