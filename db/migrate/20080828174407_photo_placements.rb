class PhotoPlacements < ActiveRecord::Migration
  def self.up
    create_table :photo_placements do |t|
      t.integer :photo_id
      t.integer :story_id
      t.integer :display_height
      t.integer :display_width
      t.string :caption
      t.timestamps
    end
  end

  def self.down
    drop_table :photo_placements
  end
end


