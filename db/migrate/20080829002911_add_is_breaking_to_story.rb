class AddIsBreakingToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :is_breaking, :boolean
  end

  def self.down
    remove_column :stories, :is_breaking
  end
end
