class Track < ActiveRecord::Base # dunno if I can actually even do it..
  attr_accessor :title, :band, :cover, :sc_id, :genre, :permalink_url

  def initialize title, sc_id, band="Metallica", cover="", genre="unknown", permalink_url
    @sc_id = sc_id
    @title = title
    @band = band
    @cover = cover
    @genre = genre
    @permalink_url = permalink_url
  end

  has_many :tracklists, foreign_key: :track_sc_id, primary_key: "sc_id"
  has_many :playlists, through: :tracklists

  @@limit = 10

  def self.limit=limit
      @@limit = limit
  end

  def self.limit
      @@limit || 10
  end

  def to_param
    @title.parameterize
  end

  def self.all
    [
  #    Track.new("Enter Sandman", "Metallica", "http://www.earlytorise.com/wp-content/uploads/2009/10/metallica-enter-sandman-dirty-funker-remixs.jpg"),
  #    Track.new("Lol", "Blog 27"),
  #    Track.new("Hello"),
  #    Track.new("Enter Sandman", "Iron"),
    ]
  end

  def self.find_all title
    new_client.get("/tracks", q: title, limit: limit).map do |track|
      sc_to_track(track)
    end
  end

  # 23/10 adding this method TODO!
  def self.find_by_genre find_by_genre
    new_client.get("/tracks", q: genre, limit: limit).map do |track|
      sc_to_track(track)
    end
  end

  def self.find id
    track = new_client.get("/tracks/#{id}")
    sc_to_track(track)
  end

  def self.new_client
    client = Soundcloud.new(:client_id => "ba08463663204b0206edffa3e8051c12")
  end

  def self.sc_to_track track
    Track.new(track.title,
              track.id,
              track.user.username,
              track.artwork_url,
              track.genre,
              track.permalink_url)
  end

  # 23/10 adding a soundloud player widget
  def music_player
    embed_info = Track.new_client.get('/oembed', :url => self.permalink_url)
    embed_info['html'].html_safe # needed to add .html_safe to properly show the widget
  end
end
