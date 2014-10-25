class Tracklist < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :track_id
end