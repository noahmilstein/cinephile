Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :movies do
    resources :reviews, only: [:create, :destroy, :edit]
  end
  resources :reviews, only: [:update]
  resources :users
end
