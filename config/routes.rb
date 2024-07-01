Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about',to: 'homes#about', as: :about
  resources :post_comments, skip: [:index]

  resources :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } do
    resource :relationships, only: [:create, :destroy] do
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
  end

  resources :posts do
      resources :tags, only: [:index, :create]
      resources :favorites, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
