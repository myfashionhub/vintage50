Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :new, :create]
  post 'products/filter'=> 'products#filter'
  get 'products/search' => 'products#search'

  resources :closet_contents, only: [:index, :create, :destroy]

  get 'sessions'        => 'sessions#index', as: 'login'
  post 'sessions'       => 'sessions#create'
  delete 'sessions'     => 'sessions#destroy', as: 'logout'

  resources :users, except: [:show]
  get '/account' => 'users#show'

  resources :about, only: [:index]
end

# users GET    /users(.:format)           users#index
#                POST   /users(.:format)           users#create
#       new_user GET    /users/new(.:format)       users#new
#      edit_user GET    /users/:id/edit(.:format)  users#edit
#           user GET    /users/:id(.:format)       users#show
#                PATCH  /users/:id(.:format)       users#update
#                PUT    /users/:id(.:format)       users#update
#                DELETE /users/:id(.:format)       users#destroy
#      users_new GET    /users/new(.:format)       users#new
#     users_edit GET    /users/edit(.:format)      users#edit
