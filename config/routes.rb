Rails.application.routes.draw do

  root 'products#index'
  resources :products, only:[:new,:create, :destroy]
  resources :cards, only: [:index]

  # work ログアウト画面のパス。後ほど変更予定
  get :signout, to: 'users#sign_out'

  # work 商品出品画面のパス。後ほど変更予定
  get :sellproduct, to: 'users#sell_product'

end
