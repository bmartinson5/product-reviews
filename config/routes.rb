Rails.application.routes.draw do
  get '/user' => 'user#show'
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :reviews
  end


end
