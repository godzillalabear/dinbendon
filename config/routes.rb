Rails.application.routes.draw do
  resources :categories

  resources :items do
    member do
      post :add_to_cart
    end
      
    resources :comments, only:[:create]
  end
  
  #cart
  resource :cart, only: [:show, :destroy]

  # users
  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"
  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"

  root "items#index"
  
  # APIs
  namespace :api do         
    namespace :v1 do        
      resources :items, only:[] do   
        member do             
          post :favorite          
        end                 
      end
    end
  end
end



