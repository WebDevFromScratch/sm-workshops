class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :sc_id
      t.string :title
      t.string :band
      t.string :cover
      t.string :genre
      t.string :permalink_url

      t.timestamps
    end
  end
end
