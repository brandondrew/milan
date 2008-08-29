class AddSectionIdToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :section_id, :integer
  end

  def self.down
    remove_column :stories, :section_id
  end
end
