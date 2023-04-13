Rails.application.routes.draw do

  root "users#new"

  get '/profil', to: 'users#edit', as: :profil
  post '/profil', to: 'users#update'

  resources :users, only: %i[new create edit] do 
    member do 
      get 'confirm'
    end
  end

  resources :sessions, only: %i[new create destroy] 

end
