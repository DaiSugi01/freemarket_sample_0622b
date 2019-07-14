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
  end
  
  private

  # ピックアップアイテムに表示する一覧を取得する
  def getItems(categoryId)
    return TblProduct.joins(:mst_major_category, :tbl_product_images).merge(MstMajorCategory.where(id: categoryId)).distinct.order(id: "desc").limit(4)
  end

end
