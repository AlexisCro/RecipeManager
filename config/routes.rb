Rails.application.routes.draw do

  root "users#new"

  get '/profil', to: 'users#edit', as: :profil
  post '/profil', to: 'users#update'

  resources :users, only: %i[new create edit] do 
    member do 
      get 'confirm'
    end
  end

  #Session CRUD
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

end
