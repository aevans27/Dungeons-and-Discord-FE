Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

 
  get "/discord", to: "users/omniauth_callbacks_controller#discord"

  # get "/users/:user_id"
end

