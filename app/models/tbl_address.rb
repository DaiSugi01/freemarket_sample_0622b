class TblAddress < ApplicationRecord
  belongs_to :tbl_user 
  
  validates :full_name, presence: true
  validates :full_nmae_kana, presence: true
  validates :zip, presence: true
  validates :mst_prefecture_id, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  validates :zip, format: { with: /[0-9]+/, message: 'は半角数字のみ使用できます'}
  validates :phone, format: { with: /[0-9\-]+/, message: 'は半角数字とハイフンのみ使用できます'}
end
