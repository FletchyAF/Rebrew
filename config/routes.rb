Rails.application.routes.draw do

  resources :users, only: [:new] do
      resources( :brewery_reviews, except: [:index]) 
  end

  resources :breweries, only:[:index, :new, :show] do
      resources( :brewery_reviews, except: [:index])
  end
  
  resources :brewery_reviews, only: [:edit, :index, :new, :show, :update]

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

end
