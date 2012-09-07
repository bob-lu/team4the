Team4the::Application.routes.draw do
  resources :achievements

  root :to => 'page#index'
end