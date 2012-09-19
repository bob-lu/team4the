Team4the::Application.routes.draw do
  resources :users
  resources :achievements
  resources :workout
  
  root :to => 'page#index'
  
  get '/login', :to => 'session#new'
  post '/login', :to => 'session#create'

  match '/logout', :to => 'session#destroy'
  get "/dashboard" => "page#dashboard"
  get "/ego-table" => "page#ego_table", :as => :ego_table
  get "/team/:id" => "teams#show", :as => :team
end