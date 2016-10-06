Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'

  resources :users

  resources :movies do
    resources :reviews
  end

  resources :reviews do
    resources :votes do
      collection do
        post '/upvote', to: 'votes#upvote', as: 'upvote'
        post '/downvote', to: 'votes#downvote', as: 'downvote'
      end
    end
  end
end
