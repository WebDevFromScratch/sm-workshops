class ChangeTrackScIdToTrackIdScIdInTracklists < ActiveRecord::Migration
  def change
    add_column :tracklists, :track_id_sc_id, :integer
    remove_column :tracklists, :track_sc_id, :integer
  end
end
