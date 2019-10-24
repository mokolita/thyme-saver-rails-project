Rails.application.routes.draw do
  resources :plants
  resources :users do 
    resources :plants, only: [:create, :new, :show, :index, :destroy] do 
      resources :plants_users 
    end
  end 

  delete '/instructions/delete' => 'instructions#destroy', as: 'delete_instruction'
  patch 'plants_users/status' => 'plants_users#add_status', as: 'add_status'
  post 'plants/search' => 'plants#search', as: 'plants_search'
  
  get 'auth/facebook/callback' => 'sessions#omniauth'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
