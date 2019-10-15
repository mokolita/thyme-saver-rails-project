Rails.application.routes.draw do
  resources :plants
  resources :users
  resource :sessions, only: [:create]
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'

  root "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
