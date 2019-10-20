Rails.application.routes.draw do
  get 'trips/index'
  get 'trips/show'
  get 'trips/new'
  post 'trips/create'
  patch 'trips/end_trip'
  resources :trips, except: [:destroy]
  resources :stations, only: [:index, :show]
  resources :bikes, only: [:index, :show]
  resources :user, only: [:index, :show]
end
