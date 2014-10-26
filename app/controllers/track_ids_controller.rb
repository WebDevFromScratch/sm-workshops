class TrackIdsController < ApplicationController
  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @track_id = TrackId.find(params[:id])

    @track_id.destroy
    redirect_to playlist_path(@playlist) # redirecting back to the playlist, this is not very CRUD - rename the action somehow?
  end
end