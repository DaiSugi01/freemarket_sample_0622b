Rails.application.routes.draw do

  devise_for :tbl_users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'items#index'
end
