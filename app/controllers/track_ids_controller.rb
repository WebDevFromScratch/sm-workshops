class TrackIdsController < ApplicationController
  def destroy
    @user = current_user
    @playlist = Playlist.find(params[:playlist_id])
    @track_id = TrackId.find(params[:id])

    @track_id.destroy
    redirect_to user_playlist_path(@user, @playlist) # redirecting back to the playlist, this is not very CRUD - rename the action somehow?
  end
end