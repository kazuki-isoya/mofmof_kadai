Rails.application.routes.draw do
  resources :near_stations
  resources :properties
  root 'properties#index'
end
