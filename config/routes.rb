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
  resource :comments, only: [:create,:edit,:update]
  resources :answers, only: [:create,:edit,:update,:new,:show]
  resources :questions, only: [:create,:edit,:update,:new,:show]
  get '/answer/:id/:question/sumar', to: 'answers#sumar'
  get '/question/:id/edit/sumar', to: 'questions#sumar'
  get '/answer/:id/:question/resta', to: 'answers#resta'
  get '/question/:id/edit/resta', to: 'questions#resta'
  get '/index/:order', to: 'questions#index'
  





end
