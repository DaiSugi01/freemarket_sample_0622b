class ImageItem < ApplicationRecord
  mount_uploader :image, ImageUploader
end
