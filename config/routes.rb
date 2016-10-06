Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :users

  resources :movies do
    resources :reviews
  end
end
