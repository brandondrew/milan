class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.string :section
      t.string :author
      t.string :extract

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
