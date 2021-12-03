Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 

  # libraries
  root 'libraries#index'
  get '/Libraries', to: 'libraries#index', as: 'libraries'
  post '/Libraries', to: 'libraries#create', as: 'add_book'
  delete '/Libraries/:id', to: 'libraries#destroy', as: 'library_delete'
  get '/Libraries/new', to: 'libraries#new', as: 'new_library'
  patch '/libraries/:id', to: 'libraries#update', as: 'update'
  post '/libraries/:id/borrow', to: 'libraries#borrow', as: 'borrow_book'

  # users

  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#edit', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/waitinglist/:id', to: 'waitinglists#index', as: 'waitinglist'
  post '/waitinglist/:id', to: 'waitinglists#new'
end
