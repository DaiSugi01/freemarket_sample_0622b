class ProductImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
