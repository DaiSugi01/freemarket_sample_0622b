class TblUser::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback
  end

  private
  def callback
    @user = TblUser.find_or_initialize_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session[:auth] = request.env['omniauth.auth']
      redirect_to new_tbl_user_registration_path
    end
  end
end