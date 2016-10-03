Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :movies
  # devise_for :users do
  # end
  # resources :users, only: [] do
  #   collection do
  #     get '/search', to: 'users#search', as: 'search'
  #   end
  #   # resources :movies
  # end
  # devise_scope :user do
  #   authenticated :user do
  #     root "users#search", as: :authenticated_root
  #   end
  #   unauthenticated :user do
  #     root "devise/sessions#create", as: :unauthenticated_root
  #   end
  # end
end
