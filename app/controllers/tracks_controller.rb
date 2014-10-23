class TracksController < ApplicationController
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
    @playlist = Playlist.first # hardcoded (btw, do i need a '@' var here?)
    @track = Track.find(params[:id]) # track not initialized... seems like some SoundCloud problem BUT! the same thing shows in track method, so should be okay
    @id = TrackId.new(:sc_id => @track.sc_id) # somehow, I can't name this var @track_id... conflict of sorts?
    
    # later on think on how to not make a new track_id everytime, but check if one with that sc_id already exists in the db
    # actually! I could do this saving each track_id as new, will only need to delete all track_ids which belongs to a playlist when removing them from that playlist/deleting that whole playlist

    @id.save
    @playlist.track_ids << @id
    
    # add a flash alert later on TODO!
    render :track
  end
end
