Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about',to: 'homes#about', as: :about
  resources :post_comments, skip: [:index]
  resources :users, only: [:index, :edit, :show, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "rerationships#followers", as: "followers"
  end

  resources :posts do
      resources :tags, only: [:index, :create]
      resources :favorites, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
