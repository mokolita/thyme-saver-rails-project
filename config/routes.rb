Rails.application.routes.draw do
  resources :plants
  resources :users do 
    resources :plants, only: [:create, :new, :show, :index] do 
      resources :plants_users
    end
  end 


  post 'plants/search' => 'plants#search', as: 'plants_search'
  
  get 'auth/facebook/callback' => 'sessions#omniauth'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
