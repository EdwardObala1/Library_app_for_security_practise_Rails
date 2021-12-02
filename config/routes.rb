Rails.application.routes.draw do
  # resources :libraries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/library' , to:'library#index', as: 'library'
  # delete '/library/:id' ,to: 'library#destroy', as: 'library_delete'
  root 'libraries#index'
  get '/Libraries', to: 'libraries#index', as: 'libraries'
  post '/Libraries/new', to: 'libraries#create', as: 'add_book'
  delete '/Libraries/:id', to: 'libraries#destroy', as: 'library_delete'
  get '/Libraries/new', to: 'libraries#new', as: 'new_library'
  patch '/libraries/:id', to: 'libraries#update', as: 'update'
end
