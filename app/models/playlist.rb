class Playlist < ActiveRecord::Base
  has_many :tracklists
  has_many :track_ids, through: :tracklists
end