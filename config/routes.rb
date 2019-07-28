Rails.application.routes.draw do

  root 'products#index'
  resources :products, only:[:new,:create]
  resources :cards, only: [:index]

  # work ログアウト画面のパス。後ほど変更予定
  get :signout, to: 'users#sign_out'

end
