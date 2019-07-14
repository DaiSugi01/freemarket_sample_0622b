class ItemsController < ApplicationController

  def index
    # レディース
    @ladies_products = getItems(1)
    # メンズ
    @mens_products = getItems(2)
    # ベビー・キッズ
    @kids_products = getItems(3)
    # コスメ・香水・美容
    @cosmes_products = getItems(4)
    # シャネル
    @chanel_products = getBlands(1)
    # ルイ ヴィトン
    @vuitton_products = getBlands(2)
    # シュプリーム
    @supreme_products = getBlands(3)
    # ナイキ
    @nike_products = getBlands(4)
  end
  
  private

  # ピックアップアイテムに表示する一覧を取得する
  def getItems(categoryId)
    return TblProduct.joins(:mst_major_category, :tbl_product_images).merge(MstMajorCategory.where(id: categoryId)).distinct.order(id: "desc").limit(4)
  end

  # ピックアップブランドに表示する一覧を取得する
  def getBlands(blandId)
    return TblProduct.joins(:mst_brand, :tbl_product_images).merge(MstBrand.where(id: blandId)).distinct.order(id: "desc").limit(4)
  end

end
