class ChangeTrackIdScIdToTrackIdIdInTracklists < ActiveRecord::Migration
  def change
    remove_column :tracklists, :track_id_sc_id, :integer
    add_column :tracklists, :track_id_id, :integer
  end
end
