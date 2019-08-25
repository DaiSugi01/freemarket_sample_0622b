class ProductsController < ApplicationController
  before_action :redirect_to_registration, except: [:index]

  def index
    # レディース
    @ladies_products = TblProduct.get_items(1)
    # メンズ
    @mens_products = TblProduct.get_items(2)
    # ベビー・キッズ
    @kids_products = TblProduct.get_items(3)
    # コスメ・香水・美容
    @cosmes_products = TblProduct.get_items(4)
    # シャネル
    @chanel_products = TblProduct.get_blands(1)
    # ルイ ヴィトン
    @vuitton_products = TblProduct.get_blands(2)
    # シュプリーム
    @supreme_products = TblProduct.get_blands(3)
    # ナイキ
    @nike_products = TblProduct.get_blands(4)
  end

  def new
    @product = TblProduct.new
    @image = @product.tbl_product_images.new
  end
  
  def create
    @product = TblProduct.create(product_params)
    @product.tbl_user_id = current_tbl_user.id

    if @product.save
      params[:tbl_product_images]['image'].first(10).each do |a|
        @image = @product.tbl_product_images.create!(image: a)
      end
      redirect_to :root
    else
      render action: 'new'
    end
  end

  def pay
    begin
      token_id = TblCard.select("token").find_by(tbl_user_id: current_tbl_user.id)
    rescue => e
      redirect_to root_path
    end
  end
  
  def show
    @product = TblProduct.find(params[:id])
    @image = @product.tbl_product_images
  end

  def done
  end

  def confirm
    @product = TblProduct.find(params[:id])
  end

  private

  def product_params
    params.require(:tbl_product).permit(:id,
                                        :name, 
                                        :description,
                                        :price,
                                        :mst_major_category_id,
                                        :mst_brand,
                                        :mst_size,
                                        :mst_condition_id,
                                        :mst_burden_id,
                                        :mst_delivery_method,
                                        :mst_prefecture_id,
                                        :mst_delivery_time_id,
                                        
                                        :tbl_user_id,
                                        tbl_product_images_attributes: [:image]
                                        ).merge(mst_status_id: 1)
  end

  def redirect_to_registration
    unless tbl_user_signed_in?
      redirect_to new_tbl_user_registration_path
    end
  end
end
