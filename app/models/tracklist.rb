class Tracklist < ActiveRecord::Base
  belongs_to :playlist, foreign_key: :track_sc_id, primary_key: "sc_id"
  belongs_to :track
end