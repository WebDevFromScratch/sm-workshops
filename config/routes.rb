Rails.application.routes.draw do

  get "/", controller: "home", action: "index", as: "home"
  get "/contact", controller: "home", action: "contact"
  get "/about", controller: "home", action: "contact"
  get "/track/:id", controller: "tracks", action: "track", as: :track
  post "/search", controller: "home", action: "search"

  resources :playlists, only: [:index, :show, :new, :create] do
    resources :track_ids, only: [:destroy]
    # member do
    #   post 'remove_track' # maybe this should be taken care of by TrackId controller?
    # end
  end

  resources :tracks, only: [] do
    member do
      post 'add_to_playlist' # think this over...
    end
  end
end
