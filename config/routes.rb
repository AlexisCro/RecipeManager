Rails.application.routes.draw do

  root "users#new"

  # Users routes 
  resources :users, only: %i[new create edit] do 
    member do 
      get 'confirm'
    end
  end

  get '/profil', to: 'users#edit', as: :profil
  post '/profil', to: 'users#update'

  resources :passwords, only: %i[new create edit update]

  # Session CRUD
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  # Cookbook CRUD
  resources :cookbooks, only: %i[index show edit update]

  # Recipe CRUD
  resources :recipes do
    resources :ingredients, only: %i[create edit destroy]
  end
end
