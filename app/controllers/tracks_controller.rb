class TracksController < ApplicationController
  before_action :set_user_and_playlists, only: [:track, :add_to_playlist]

  def track
    id = params[:id]
    @track = Track.find(id)

    #@track = Track.new(@track.title,
    #                    @track.id,
    #                    @track.user.username,
    #                    @track.artwork_url)
    #@track = Track.all.find do |track|
    #  track.to_param == params[:param_title]
    #end
  end

  def find_soundcloud_by_id id
    # check Soundcloud API
    client = Soundcloud.new(:client_id => "ba08463663204b0206edffa3e8051c12")
    client.get("/tracks/#{id}")
  end

  def add_to_playlist
    @playlist = Playlist.find(params[:playlist])
    @track = Track.find(params[:id])
    @new_track_id = TrackId.new(:sc_id => @track.sc_id) # somehow, I can't name this var @track_id... conflict of sorts?

    @new_track_id.save
    @playlist.track_ids << @new_track_id
    
    # add a flash alert later on TODO!
    redirect_to track_path(@track.sc_id)
  end

  def set_user_and_playlists
    @user = current_user
    @playlists = @user.playlists.all
  end
end
