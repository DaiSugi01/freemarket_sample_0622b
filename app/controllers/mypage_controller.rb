class MypageController < ApplicationController
  before_action :redirect_to_top

  def index
  end

  def signout
  end

  def sell_product
    # work 対応状況実装後、条件を変更する。
    @contents = TblProduct.where(tbl_user_id: current_tbl_user.id)
  end

  def sell_product_detail
    @product_detail = TblProduct.find(params[:id])
  end

  def destroy
    product = TblProduct.find(params[:id])
    product.destroy
    redirect_to action: :sell_product
  end

  private

  def redirect_to_top
    unless tbl_user_signed_in?
      redirect_to root_path
    end
  end
end
