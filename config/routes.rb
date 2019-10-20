Rails.application.routes.draw do
  resources :trips, except: [:destroy]
  resources :stations, only: [:index, :show]
  resources :bikes, only: [:index, :show]
  resources :user, only: [:index, :show]
end
