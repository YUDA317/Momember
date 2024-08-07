Rails.application.routes.draw do
  devise_for :users
  get "followings" => "relationships#followings", as: "followings"
  get "followers" => "rerationships#followers", as: "followers"
  root to: "homes#top"
  get 'homes/about',to: 'homes#about', as: :about
  get '/user/:user_id',to: 'posts#index'
  resources :post_comments, skip: [:index]
  resources :users
  resources :posts
  resources :tags, only: [:index, :create]
  get '/post/tag/:name' => 'posts#tag'
  get '/post/tag' => 'posts#tag'
  resources :favorites, only: [:index, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
