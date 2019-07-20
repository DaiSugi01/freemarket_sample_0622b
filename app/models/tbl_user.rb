class TblUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :phone, presence: true

  validates :last_name_kana, format: { with: /\p{Katakana}/, message: 'は全角カナで入力してください' } 
  validates :first_name_kana, format: { with: /\p{Katakana}/, message: 'は全角カナで入力してください' } 
  validates :birthday, format: { with: /[0-9\-]+/, message: 'は半角数字とハイフンのみ使用できます'}
  validates :phone, format: { with: /[0-9\-]+/, message: 'は半角数字とハイフンのみ使用できます'}

  has_one :tbl_profile
  has_many :tbl_addresses
end
