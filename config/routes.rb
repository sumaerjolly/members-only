Rails.application.routes.draw do
  get '/sign_up', to: 'users#new'
  get    '/sign_in',   to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'
  resources :posts, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
  root 'posts#index'
end
