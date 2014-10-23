class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all # avoid using all later on
  end

  def show
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
end