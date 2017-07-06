Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  root 'questions#index'
  resources :users
  resources :account_activations, only: [:edit]
  delete 'logout', to: 'sessions#destroy'
  resources :reset_passwords
  resources :questions

end
