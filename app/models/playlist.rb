class Playlist < ActiveRecord::Base
  has_many :tracklists
  has_many :tracks, through: :tracklists
end