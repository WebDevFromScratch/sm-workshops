class AddPlaylistIdToTrackIds < ActiveRecord::Migration
  def change
    add_column :track_ids, :playlist_id, :integer
  end
end
