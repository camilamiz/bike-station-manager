Rails.application.routes.draw do
  resources :stations, only: [:index, :show]
  resources :bikes, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :trips, only: [:index, :show, :new, :create]
  patch 'trips', to: 'trips#end_trip'
end
