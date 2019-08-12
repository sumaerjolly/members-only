Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign_up', to: 'users#new'
  get    '/sign_in',   to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  
end
