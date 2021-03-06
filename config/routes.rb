Rails.application.routes.draw do
  root to: 'welcome#show'

  namespace :admin do
    resources :orders, only: [:update]
    resources :users, only: [:update, :edit]
    resources :items, only: [:index, :edit, :update]
    get '/dashboard', to: 'dashboard#index'
    get '/:id', to: 'dashboard#show'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  resources :users, only: [:create, :new]

  resources :orders, only: [:index, :show, :create]

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'
  put '/cart', to: 'carts#update'

  resources :items, only: [:index, :show]

  get ':category_title', to: 'categories#show'


end
