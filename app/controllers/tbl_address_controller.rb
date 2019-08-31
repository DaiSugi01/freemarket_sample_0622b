class TblAddressController < ApplicationController
  before_action :redirect_to_top, only: [:new]

  def new
    @address = TblUser.find(params['tbl_user_id']).tbl_addresses.new()
    @prefs = MstPrefecture.all()
  end

  def create
    @address = TblAddress.new(tbl_address_params)
    if @address.save
      redirect_to root_path
    else
      @prefs = MstPrefecture.all()
      render 'new'
    end
  end

  def edit
    @prefs = MstPrefecture.all()
    @address = TblAddress.find(params[:id])
  end

  def update
    @address = TblAddress.find(params[:id])
    unless @address.update(tbl_update_address_params)
      @prefs = MstPrefecture.all()
      render :edit
    end
  end

  private
  def tbl_address_params
    params.permit(:full_name, :full_name_kana, :zip, :address, :phone, :tbl_user_id).merge(params.require(:tbl_address) .permit(:mst_prefecture_id))
  end

  def tbl_update_address_params
    params.require(:tbl_address).permit(:zip, :address, :phone)
  end

  def redirect_to_top
    unless tbl_user_signed_in?
      redirect_to root_path
    end
  end
end
