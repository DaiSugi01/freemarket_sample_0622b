Rails.application.routes.draw do

  devise_for :tbl_users
  root 'items#index'
end
