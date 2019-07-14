Rails.application.routes.draw do

  devise_for :tbl_users, :controllers => {
    :registrations => 'tbl_user/registrations'
  }
  get '/address' => 'tbl_address#new'
  post '/address' => 'tbl_address#create'
  root 'items#index'
end
