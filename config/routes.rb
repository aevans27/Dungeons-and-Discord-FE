Rails.application.routes.draw do

  root 'home#index'

  get '/users', to: "users#show"
  get '/users/char_create', to: "users#char_create"
  post '/users/:char_id/char_create', to:"users#char_save"

  get '/users/:char_id/prof_show', to: "users#prof_show"
  post '/users/:char_id/char_prof', to: "users#char_prof"

  get '/users/:char_id/equipment_show', to:"users#equipment_show"
  post '/users/:char_id/add_items', to: "users#add_items"
  
  get "/users/:char_id/char_stats", to:"users#char_stats"
  post "/users/:char_id/char_stats", to:"users#stat_save"
  get "/users/:char_id/char_show", to:"users#char_show"
  delete "/users/char_delete/:char_id", to:"users#char_delete"
  
  get "/user/auth/discord/callback", to: "sessions#create"
  
  get '/api/oauth2/authorize', to: "sessions#dummy_test"
  get "active",  to: "sessions#active"
  get "timeout", to: "sessions#timeout"
end

