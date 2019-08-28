class TblProfile < ApplicationRecord
  mount_uploader :icon, ImageUploader

  belongs_to :tbl_user

  validates :nickname, presence: true
end
