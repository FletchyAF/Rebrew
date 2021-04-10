Rails.application.routes.draw do

  resources :users, only: [:new] do
      resources( :brewery_reviews) 
  end

  resources :breweries, only:[:index, :new, :show, :create] do
      resources( :brewery_reviews)
  end
  
  resources :brewery_reviews

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

end
