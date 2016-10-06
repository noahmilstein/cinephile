Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :movies do
    resources :reviews, only: [:create, :destroy, :edit, :update]
  end
  resources :users

  resources :movies do
    resources :reviews
  end
end
