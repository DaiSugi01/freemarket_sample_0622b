class TblAddressController < ApplicationController
  before_action :tbl_address_params, only: [:create]

  def new
    @address = current_tbl_user.tbl_addresses.new()
    @prefs = MstPrefecture.all()
  end

  def create
    @address = current_tbl_user.tbl_addresses.new(tbl_address_params)
    @address.save()
    redirect_to root_path 
  end

  private
  def tbl_address_params
    params.permit(:full_name, :full_name_kana, :zip, :address, :phone).merge(params.require(:tbl_address).permit(:mst_prefecture_id))
  end
end
