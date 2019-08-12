class TblUser::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback
  end

  private
  def callback
    @user = TblUser.find_or_initialize_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      self.current_tbl_user = @user
      redirect_to root_path
    else
      redirect_to new_tbl_user_registration_path(resource = @user)
    end
  end
end