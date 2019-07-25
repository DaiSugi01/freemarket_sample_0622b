Rails.application.routes.draw do

  root 'products#index'
  resources :products, only:[:new, :create]
  resources :cards, only: [:index]

end
