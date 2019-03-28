Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'dbmap', to: 'static_pages#dbmap'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get '/marks/:slug', to: 'marks#category', as: 'mark_slug'
  
  resources :users do
    member do
      resources :lists, param: :list_id
      resources :stars, param: :star_id
    end
  end

  resources :marks
  get 'search', to: 'marks#search'
  
  resources :categories
  resources :settings
end
