class CreateTracklists < ActiveRecord::Migration
  def change
    create_table :tracklists do |t|
      t.integer :playlist_id
      t.integer :track_sc_id

      t.timestamps
    end
  end
end
