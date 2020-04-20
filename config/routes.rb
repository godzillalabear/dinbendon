Rails.application.routes.draw do
  resources :categories

  resources :items do 
    resources :comments, only:[:create]
  end
  # resources :comments
  # /comments
  # /comments/:id
  # /comments/:id/edit

  # users
  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"
  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"

  root "items#index"
end

