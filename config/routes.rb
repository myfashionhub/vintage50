Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :new, :create]
  post 'products/filter'=> 'products#filter'
  get 'products/search' => 'products#search'
  
  get '/inventory' => 'inventory#index'

  get '/closet' => 'closet_contents#index'
  post '/closet' => 'closet_contents#create'
  delete '/closet' => 'closet_contents#destroy'

  resources :users, except: [:show]
  get '/account' => 'users#show'

  resources :sessions, only: [:create]
  get '/logout'     => 'sessions#destroy'

  get '/about' => 'welcome#about'
  get '/login' => 'welcome#login'
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
