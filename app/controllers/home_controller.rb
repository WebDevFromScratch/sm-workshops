class HomeController < ApplicationController

  def index
    @tracks = Track.all
  end

  def search
    title = params[:title].to_s
    @tracks = Track.find_all(title)

    render "home/index"
  end

  def contact

  end

  private

  def find_soundcloud title
    client = Soundcloud.new(:client_id => "ba08463663204b0206edffa3e8051c12")
    client.get("/tracks", q: title, limit: 10)
  end
end
