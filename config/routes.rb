Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :movies
  resources :users

end


# devise_scope :user do
#   authenticated :user do
#     root "movies#index", as: :authenticated_root
#   end
#   unauthenticated :user do
#     root "devise/registrations#new", as: :unauthenticated_root
#   end
# end
