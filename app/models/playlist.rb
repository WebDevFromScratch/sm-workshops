class Playlist < ActiveRecord::Base
  has_many :track_ids
  belongs_to :user

  validates_presence_of :name
end