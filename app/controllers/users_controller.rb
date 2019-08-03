class UsersController < ApplicationController

  def signout
  end

  def mypage
  end

  def sell_product
    # work 対応状況実装後、条件を変更する。
    @contents = TblProduct.where(tbl_user_id: current_tbl_user.id)
  end
  
end
