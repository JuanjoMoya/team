Rails.application.routes.draw do
  # get 'groups/index'
  #
  # get 'groups/show'
  #
  # get 'groups/new'
  #
  # get 'groups/create'
  #
  # get 'groups/edit'
  #
  # get 'groups/update'
  #
  # get 'groups/destroy'
  #
  # get 'sessions/new'

  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'users/edit'
  #
  # get 'users/update'
  #
  # get 'users/destroy'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users,             except: [:new, :create]
  resources :messages,          only: [:create, :destroy]
  resources :groups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
