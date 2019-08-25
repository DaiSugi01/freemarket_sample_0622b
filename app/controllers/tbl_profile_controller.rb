class TblProfileController < ApplicationController

  def edit
    @profile = current_tbl_user.tbl_profile
  end

  def update
    @profile = TblProfile.find(params[:id])
    @profile.update(tbl_profile_param)
  end

  private
  def tbl_profile_param
    params.require(:tbl_profile).permit(:nickname, :description, :icon)
  end
end
