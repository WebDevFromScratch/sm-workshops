class PlaylistsController < ApplicationController
  before_action :require_user
  before_action :set_user

  def index
    @playlists = @user.playlists.all # avoid using all later on (page-ify or sth)
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
    @playlist.user_id = @user.id

    if @playlist.save
      flash[:success] = "You have created a new playlist"
      redirect_to user_playlists_path(@user)
    else
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])

    @playlist.track_ids.each { |track_id| track_id.destroy } # first remove all now unnecessary TrackId objects
    @playlist.destroy
    flash[:success] = "The playlist has been deleted"
    redirect_to user_playlists_path(@user)
  end

  private

  def set_user
    @user = current_user
  end
end