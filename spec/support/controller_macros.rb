module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:tbl_user]
    sign_in user
  end
end