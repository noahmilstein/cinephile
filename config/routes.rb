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
        post "/upvote", to: "votes#upvote", as: "upvote"
        post "/downvote", to: "votes#downvote", as: "downvote"
      end
    end
  end

  namespace :api, :defaults => { :format => 'json' } do
    resources :votes do
    end
  end

  get "/upvote", to: "api/votes#upvote", defaults: { format: 'json'}
  get "/downvote", to: "api/votes#downvote", defaults: { format: 'json'}
end
