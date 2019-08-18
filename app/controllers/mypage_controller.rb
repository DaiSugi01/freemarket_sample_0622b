class MypageController < ApplicationController
  before_action :redirect_to_top

  def index
  end

  def redirect_to_top
    unless tbl_user_signed_in?
      redirect_to root_path
    ena
  end
end
