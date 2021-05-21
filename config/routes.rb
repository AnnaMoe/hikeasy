Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :hikes, only: [:index, :show] do
    resources :bookings, only: [:create, :new, :show, :update, :edit] do
      member do
        get 'chatroom' 
      end
      member do
        get 'confirmation'
      end
      
      resources :reviews, only: [:new, :create ]
    end
  end
  resources :chatrooms, only: [] do
    resources :messages, only: :create
  end
  resources :dashboard, only: [:index] 
end
