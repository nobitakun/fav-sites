Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'dbmap', to: 'static_pages#dbmap'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get '/marks/:slug', to: 'categories#show'
  
  resources :users
  resources :marks
  resources :stars
  resources :categories
end
