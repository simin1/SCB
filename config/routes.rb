Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/new'
  get 'comments/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'toukou', to: 'topics#new'
  
  resources :users, only: [:new, :create]
  
  resources :topics, only: [:index, :show, :new, :create, :destroy]
  
  resources :comments, only: [:new, :create, :destroy]
end
