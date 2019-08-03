Rails.application.routes.draw do
  devise_for :tbl_users, :controllers => {
    :registrations => 'tbl_user/registrations'
  }
  resources :tbl_users do
    resources :tbl_address, only: [:new, :create]
  end
  root 'products#index'
  resources :products, only:[:new,:create, :destroy]
  resources :cards, only: [:index]

  # work ログアウト画面のパス。後ほど変更予定
  get :signout, to: 'users#sign_out'

  # work 商品出品画面のパス。後ほど変更予定
  get :sellproduct, to: 'users#sell_product'

end
