Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  # libraries
  root 'libraries#index'
  
  get '/Libraries', to: 'libraries#index', as: 'libraries'
  post '/Libraries', to: 'libraries#create', as: 'add_book'
  delete '/Libraries/:id', to: 'libraries#destroy', as: 'library_delete'
  get '/Libraries/new', to: 'libraries#new', as: 'new_library'
  patch '/libraries/:id', to: 'libraries#update'
  post '/libraries/:id/borrow', to: 'libraries#borrow', as: 'borrow_book'
  get '/libraries/:id', to: 'libraries#show', as: "show_book"
  get '/libraries/:id/edit', to: 'libraries#edit', as: 'edit_library'

  # users

  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get '/users/signin', to: 'users#signin', as: 'signin'
  post '/users/login', to: 'users#login', as: 'login'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#edit', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  
  post '/waitinglists/:id', to: 'waitinglists#new'
  delete '/waitinglists/:id', to: 'waitinglists#destroy', as: 'destroy'

  # search fucntionality
  post '/libraries/search', to: 'libraries#search', as: 'search'
  get '/libraries/search', to: 'libraries#search', as: 'libraries_search'

  # waitinglist
  get '/waitinglists', to: 'waitinglists#index', as: "waitinglists"
end
