Rails.application.routes.draw do

  root "users#new"

  resources :users, only: %i[new create] do 
    member do 
      get 'confirm'
    end
  end

end
