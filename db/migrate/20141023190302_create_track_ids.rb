class CreateTrackIds < ActiveRecord::Migration
  def change
    create_table :track_ids do |t|
      t.integer :sc_id

      t.timestamps
    end
  end
end
