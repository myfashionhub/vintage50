Rails.application.routes.draw do
  root 'products#new'
  post '/products/new'   => 'products#create'
  get '/products'        => 'products#index'
  post '/products/filter'=> 'products#filter' 
end
