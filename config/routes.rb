Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  
  get 'dbmap', to: 'static_pages#dbmap'
  
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

  # get 'signup', to: 'users#new'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :user_configs, only: [:show, :update]
  get 'config', to: 'user_configs#edit', as: 'edit_user_config'
  
  resources :marks do
    put :sort
  end
  
  get 'search', to: 'marks#search'
  get '/marks/:slug', to: 'marks#category', as: 'mark_slug'
  
  resources :categories
  resources :settings
  resources :default_marks
end
