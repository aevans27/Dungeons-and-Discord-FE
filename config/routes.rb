Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  get '/users', to: "users#show"
  get '/users/char_create', to: "users#char_create"
  post '/users/char_create', to:"users#char_save"


  get '/users/char_class', to: "users#char_class"
  get '/users/prof_show', to: "users#prof_show"
  post '/users/char_prof', to: "users#char_prof"

  get '/users/equipment_show', to:"users#equipment_show"
  post '/users/add_items', to: "users#add_items"
  
  get "active",  to: "sessions#active"
  get "timeout", to: "sessions#timeout"
  get "/users/char_stats", to:"users#char_stats"
  post "/users/char_stats", to:"users#stat_save"
  # get "/discord", to: "users/omniauth_callbacks_controller#discord"

  # get "/users/:user_id"
  get "/user/auth/discord/callback", to: "sessions#create"

  #testing, if you select to join Discord in test
  get '/api/oauth2/authorize', to: "sessions#dummy_test"
  # get "/login/oauth2/token", to: 


  # the link below is the generated URL to get access for a specific user.
  # https://discord.com/api/oauth2/authorize?client_id=1192879088579379231&response_type=code&redirect_uri=http%3A%2F%2F%5B%3A%3A1%5D%3A5000%2Fuser%2Fauth%2Fdiscord%2Fcallback&scope=identify
end

