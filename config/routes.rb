Rails.application.routes.draw do

  resources :users do
      resources(:brewery_reviews) 
  end

  resources :breweries do
      resources( :brewery_reviews)
  end
  
  resources :brewery_reviews do 
    resources (:breweries)
    resources (:users)
  end

  get '/', to: "users#new"
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create_with_google"
  get "/beareries", to: "breweries#beareries"
end
