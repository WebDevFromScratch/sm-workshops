Rails.application.routes.draw do

  get "/", controller: "home", action: "index", as: "home"
  get "/contact", controller: "home", action: "contact"
  get "/about", controller: "home", action: "contact"
  get "/track/:id", controller: "tracks", action: "track", as: :track
  post "/search", controller: "home", action: "search"
  get "/register", to: 'users#new' # just a different syntax
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  get "/logout", to: 'sessions#destroy' # should this be a get?

  resources :playlists, only: [:index, :show, :new, :create, :destroy] do
    resources :track_ids, only: [:destroy]
  end

  resources :tracks, only: [] do
    member do
      post 'add_to_playlist' # think this over...
    end
  end

  resources :users, only: [:create] # have to use it like a std (CRUD) route due to form_for convention
end
