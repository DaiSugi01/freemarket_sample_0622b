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

end
