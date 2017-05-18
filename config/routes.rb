Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'rankings/stock', to: 'rankings#stock'
  get 'rankings/pv', to: 'rankings#pv'

  resources :users, only: [:show, :new, :create] do
    member do
      get :stock
    end
  end

  resources :movies, only: [:index, :show]
  resources :articles
  resources :user_articles, only: [:create, :destroy]
  resources :rooms, only: [:show]

end
