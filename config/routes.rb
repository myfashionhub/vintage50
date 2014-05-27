Rails.application.routes.draw do
  root 'products#index'
  get '/products/new'    => 'products#new'
  post '/products/new'   => 'products#create'
  post '/products/filter'=> 'products#filter' 
  get '/products/search' => 'products#search'    
end
