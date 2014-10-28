class TrackIdsController < ApplicationController
  before_action :require_user

  def destroy
    @user = current_user
    @playlist = Playlist.find(params[:playlist_id])
    @track_id = TrackId.find(params[:id])

    @track_id.destroy
    flash[:success] = "The track has been removed from this playlist"
    redirect_to user_playlist_path(@user, @playlist) # redirecting back to the playlist, this is not very CRUD - rename the action somehow?
  end
end