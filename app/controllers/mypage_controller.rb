class MypageController < ApplicationController
  before_action :redirect_to_top

  # マイページトップ
  def index
  end

  # ログアウト
  def signout
  end

  # 出品した商品
  def sell_product
    # work 対応状況実装後、条件を変更する。
    @contents = TblProduct.where(tbl_user_id: current_tbl_user.id)
  end

  # 出品した商品　詳細
  def sell_product_detail
    @product = TblProduct.find(params[:id])
    @image = @product.tbl_product_images
  end

  # 商品削除
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
