class ProductsController < ApplicationController

  def index

    # レディース
    @ladies_products = TblProduct.new.getItems(1)
    # メンズ
    @mens_products = TblProduct.new.getItems(2)
    # ベビー・キッズ
    @kids_products = TblProduct.new.getItems(3)
    # コスメ・香水・美容
    @cosmes_products = TblProduct.new.getItems(4)
    # シャネル
    @chanel_products = TblProduct.new.getBlands(1)
    # ルイ ヴィトン
    @vuitton_products = TblProduct.new.getBlands(2)
    # シュプリーム
    @supreme_products = TblProduct.new.getBlands(3)
    # ナイキ
    @nike_products = TblProduct.new.getBlands(4)
  end

end
