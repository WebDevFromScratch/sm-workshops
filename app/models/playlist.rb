class Playlist < ActiveRecord::Base
  # has_many :tracklists
  # has_many :track_ids, through: :tracklists

  has_many :track_ids

  validates_presence_of :name
end