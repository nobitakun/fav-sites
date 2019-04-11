Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  
  get 'dbmap', to: 'static_pages#dbmap'
  
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

  # get 'signup', to: 'users#new'
  
  devise_for :users
  
  resources :lists
  resources :marks do
    put :sort
  end
  
  get 'search', to: 'marks#search'
  get '/marks/:slug', to: 'marks#category', as: 'mark_slug'
  
  resources :categories
  resources :settings
end
