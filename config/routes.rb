Rails.application.routes.draw do

  devise_for :users
  root "products#index"
  resources :users, only: [:index, :new,:edit]
  resources :products, only: [:index,:show,:create]
  resources :comments, only: [:index]
  resources :images, only: [:index]
  resources :cards, only: [:index]
  resources :addresses, only: [:index]
  get "users/base" => "users#base"
  get "users/_card" => "users#_card"
  get "users/privacy" => "users#privacy"
  get "users/mypage" => "users#mypage"
  get "users/finish" => "users#finish"
  get "users/select" => "users#select"
  post "users/call" => "users#call"
  get "users/address" => "users#address"
  get "users/login" => "users#login"
  get "users/add_card" => "users#add_card"
  get "users/create_card" => "users#create_card"
  get "users/logout" => "users#logout"
  
  get "products/buy" => "products#buy"
  
end