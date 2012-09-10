Team4the::Application.routes.draw do
  resources :teams

  resources :users

  resources :achievements

  resources :workout

  root :to => 'page#index'

  get '/login', :to => 'session#new'
  post '/login', :to => 'session#create'

  match '/logout', :to => 'session#destroy'
  get "/dashboard" => "page#dashboard"
end