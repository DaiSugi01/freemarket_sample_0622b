Rails.application.routes.draw do

  root 'products#index'
  resources :cards, only: [:index]

end
