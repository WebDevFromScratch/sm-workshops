class TracksController < ApplicationController
  before_action :require_user, only: [:add_to_playlist]
  before_action :set_user_and_playlists, only: [:add_to_playlist]

  def track
    if logged_in?
      set_user_and_playlists
    end

    id = params[:id]
    @track = Track.find(id)
  end

  def find_soundcloud_by_id id
    client = Soundcloud.new(:client_id => "ba08463663204b0206edffa3e8051c12")
    client.get("/tracks/#{id}")
  end

  def add_to_playlist
    @playlist = Playlist.find(params[:playlist])
    @track = Track.find(params[:id])
    @new_track_id = TrackId.new(:sc_id => @track.sc_id) # somehow, I can't name this var @track_id... conflict of sorts?

    @new_track_id.save
    @playlist.track_ids << @new_track_id
    flash[:success] = "The track has been added to #{@playlist.name}"
    redirect_to user_playlist_path(current_user, @playlist)
  end

  private

  def set_user_and_playlists
    @user = current_user
    @playlists = @user.playlists.all
  end
end
