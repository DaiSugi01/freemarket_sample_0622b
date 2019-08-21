Rails.application.routes.draw do
  devise_for :tbl_users, :controllers => {
    registrations: 'tbl_user/registrations',
    omniauth_callbacks: 'tbl_user/omniauth_callbacks',
  }
  resources :tbl_users do
    resources :tbl_address, only: [:new, :create]
  end
  root 'products#index'

  resources :products, only:[:new,:create, :show, :destroy]
  resources :cards, only: [:index]

  resources :users do
    collection do
      get 'signout'
      get 'mypage'
      get 'sell_product'
    end

    member do
      get 'sell_product_detail'
    end
  end

end
