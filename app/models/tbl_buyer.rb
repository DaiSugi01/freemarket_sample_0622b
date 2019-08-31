class TblBuyer < ApplicationRecord

  belongs_to :tbl_user
  belongs_to :tbl_product
  belongs_to :mst_correspondence
  
end
