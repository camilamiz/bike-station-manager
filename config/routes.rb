Rails.application.routes.draw do
  root to: 'stations#index'
  get '/stations', to: 'stations#index'
  get '/stations/:id', to: 'stations#show'
  
  resources :trips, except: [:destroy]
  resources :bikes, only: [:index, :show, :edit, :update]

  # resources :users, only: [:index, :show]
end
