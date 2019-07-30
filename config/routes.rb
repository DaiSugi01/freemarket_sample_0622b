Rails.application.routes.draw do
  devise_for :tbl_users, :controllers => {
    :registrations => 'tbl_user/registrations'
  }
  resources :tbl_users do
    resources :tbl_address, only: [:new, :create]
  end
  root 'items#index'
  root 'products#index'
  resources :products, only:[:new,:create]
  resources :cards, only: [:index]

end
