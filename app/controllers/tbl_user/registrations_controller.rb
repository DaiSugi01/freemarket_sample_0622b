# frozen_string_literal: true

class TblUser::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters

  def create
    super
    profile = TblProfile.new(nickname: params[:nickname], tbl_user_id: resource.id)
    profile.save
  end

  private
  def after_sign_up_path_for(resource)
    new_tbl_user_tbl_address_path(tbl_user_id: resource.id)
  end

  def after_inactive_sign_up_path_for(resource)
    new_tbl_user_tbl_address_path(tbl_user_id: resource.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone, :birthday])
  end
end
