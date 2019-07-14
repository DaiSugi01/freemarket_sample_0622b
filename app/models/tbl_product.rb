class TblProduct < ApplicationRecord

  has_many :tbl_product_images
  belongs_to :tbl_user
  belongs_to :mst_major_category
  belongs_to :mst_brand

  def get
    
  end
end
