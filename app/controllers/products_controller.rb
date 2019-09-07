class ProductsController < ApplicationController
  before_action :redirect_to_top, except: [:index,:show]
  before_action :set_product, only: [:show,:edit,:update, :confirm]


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
    # binding.pry

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
      product = TblProduct.find_by(id: params[:format])
      TblCard.pay(product.price, token_id.token)
      product.update(mst_status_id: 3)
      buyer = TblBuyer.create({tbl_user_id: current_tbl_user.id,
                              tbl_product_id: product.id,
                              mst_correspondence_id: 1})
      redirect_to done_products_path(product.id)
    rescue => e
      redirect_to root_path
    end
  end
  
  def show
    @image = @product.tbl_product_images
  end

  def edit
    @image = @product.tbl_product_images
  end

  def update
    @image = @product.tbl_product_images
    if @product.update(update_product_params)
      redirect_to sell_product_detail_mypage_path
    else
      render action: 'edit'
    end
  end

  def done
    @product = TblProduct.find_by(id: params[:format])
    @image = @product.tbl_product_images.where(tbl_product_id: params[:format]).first
  end

  def confirm
    @image = @product.tbl_product_images
    @address = current_tbl_user.tbl_addresses[0]
  end
  


  private

  def set_product
    @product = TblProduct.find(params[:id])
  end

  def redirect_to_top
    unless tbl_user_signed_in?
      redirect_to root_path
    end
  end

  def product_params
    params.require(:tbl_product).permit(:id,
                                        :name, 
                                        :description,
                                        :price,
                                        :mst_major_category_id,
                                        :mst_brand_id,
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

  def update_product_params
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
                                        tbl_product_images_attributes: [:image,:_destroy, :id]
                                        )
  end

end
