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
end
