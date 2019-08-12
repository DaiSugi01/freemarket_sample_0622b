class TblUser::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback
  end

  private
  def callback
    @user = TblUser.find_or_create_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      redirect_to root_path
    else
      render new_tbl_user_session_path
    end
  end
end