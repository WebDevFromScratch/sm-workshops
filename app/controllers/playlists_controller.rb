class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all # avoid using all later on
  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_tracks = []

    @playlist.track_ids.each do |track_id|
      track = Track.find(track_id.sc_id)
      track.track_id = track_id.id
      @playlist_tracks << track
    end
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(params.require(:playlist).permit(:name, :description))

    if @playlist.save
      # add flash alerts (both here and to the views) TODO!
      redirect_to playlists_path
    else
      render :new
    end
  end

  def remove_track
    # think this through...

    # 1. get a proper Track (actually, TrackId)
    # 2. remove the association between it and the playlist
    # 3. redirect back (render?) + add the flash message later on

    binding.pry
  end
end