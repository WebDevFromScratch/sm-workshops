class HomeController < ApplicationController
  def index
    @tracks = Track.hottest_tracks
    @tracks_header = "What's Hot Now" # this is only for the view purpose
  end

  def search
    title = params[:title].to_s
    @tracks = Track.find_all(title)
    @tracks_header = "Search Results" # this is only for the view purpose

    render "home/index"
  end

  def contact

  end

  private

  # def find_soundcloud title
  #   client = Soundcloud.new(:client_id => "ba08463663204b0206edffa3e8051c12")
  #   client.get("/tracks", q: title, limit: 10)
  # end
end
