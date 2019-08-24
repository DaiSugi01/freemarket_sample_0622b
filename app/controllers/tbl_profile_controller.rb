class TblProfileController < ApplicationController
  def show
    @profile = current_tbl_user.tbl_profile
  end

  def update

  end

  private
  def tbl_profile_param
    params.permit(:id, :nickaname, :icon, :description)
  end
end
