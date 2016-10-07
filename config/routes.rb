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

  resources :reviews do
    resources :votes do
      collection do
        post "/upvote", to: 'votes#upvote', as: 'upvote'
        post "/downvote", to: 'votes#downvote', as: 'downvote'
      end
    end
  end
end
