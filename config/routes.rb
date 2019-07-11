Rails.application.routes.draw do

  devise_for :tbl_users, :controllers => {
    :registrations => 'tbl_user/registrations'
  }
  root 'items#index'
end
