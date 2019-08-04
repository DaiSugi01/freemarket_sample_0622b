class TblProductImage < ApplicationRecord
  belongs_to :tbl_product

  mount_uploader :image, ImageUploader

end
