Rails.application.routes.draw do
  get 'stations/index'
  get 'stations/show'

  get 'trips/index'
  get 'trips/show'
  get 'trips/new'
  post 'trips/create'
  patch 'trips/end_trip'

  resources :bikes, only: [:index, :show]
  resources :user, only: [:index, :show]
end
