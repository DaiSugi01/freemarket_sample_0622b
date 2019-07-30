class TblProduct < ApplicationRecord

  has_many :tbl_product_images
  belongs_to :tbl_user
  belongs_to :mst_major_category
  belongs_to :mst_brand
  belongs_to :mst_size
  belongs_to :mst_burden
  belongs_to :mst_condition
  belongs_to :mst_delivery_method
  belongs_to :mst_delivery_time
  belongs_to :mst_prefecture
  belongs_to :mst_status

  # ピックアップアイテムに表示する一覧を取得する
  scope :get_items, -> (category_id) { joins(:mst_major_category, :tbl_product_images).merge(MstMajorCategory.where(id: category_id)).distinct.order(created_at: "desc").limit(4) }

  # ピックアップブランドに表示する一覧を取得する
  scope :get_blands, -> (bland_id) { joins(:mst_brand, :tbl_product_images).merge(MstBrand.where(id: bland_id)).distinct.order(created_at: "desc").limit(4) }
  
end
