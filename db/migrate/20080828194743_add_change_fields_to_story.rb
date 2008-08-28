class AddChangeFieldsToStory < ActiveRecord::Migration
  def self.up
    # change "extract" to "intro"
    rename_column :stories, :extract, :intro
    # and then create a new "extract"
    add_column :stories, :extract, :text
    # this is because originally extract was string, and it needed to be text
  end

  def self.down
    remove_column :stories, :extract
    rename_column :stories, :intro, :extract
  end
end
