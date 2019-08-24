class ProductsController < ApplicationController

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
    
    @product = TblProduct.all.includes(:tbl_product_images)
  end

  def new
    @product = TblProduct.new
    @image = @product.tbl_product_images.build
  end
  
  def create
    @product = TblProduct.new(product_params)
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

  def show
    @product = TblProduct.find(params[:id])
    @image = @product.tbl_product_images
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
                                        :mst_status,
                                        :tbl_user_id,
                                        tbl_product_images_attributes: [:image]
                                        )
  end
end
