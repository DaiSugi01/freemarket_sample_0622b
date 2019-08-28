class TblProfileController < ApplicationController

  def edit
    @profile = current_tbl_user.tbl_profile
  end

  def update
    @profile = TblProfile.find(params[:id])
    unless @profile.update(tbl_profile_param)
      render :edit
    end
  end

  private
  def tbl_profile_param
    params.require(:tbl_profile).permit(:nickname, :description, :icon)
  end
end
