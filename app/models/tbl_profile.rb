class TblProfile < ApplicationRecord
  belongs_to :tbl_user

  validates :nickname, presence: true
end
