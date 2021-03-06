Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/user' => "hikes#index", :as => :user_root

  resources :hikes, only: [:index, :show] do
    member do
      post 'toggle_favorite', to: "hikes#toggle_favorite"
    end
    resources :bookings, only: [:create, :new, :show, :update, :edit] do
     # member do
        get 'chatroom' 
     # end
      member do
        get 'confirmation'
      end
      
      resources :reviews, only: [:new, :create ]
    end
  end
  resources :chatroom do
    resources :messages, only: :create 
  end
  get :dashboard, to: 'dashboard#index', as: :dashboard 
end
