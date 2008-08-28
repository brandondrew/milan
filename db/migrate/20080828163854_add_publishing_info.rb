class AddPublishingInfo < ActiveRecord::Migration
  def self.up
    add_column    :stories, :publish_at,   :datetime
    add_column    :stories, :published,    :boolean
    add_column    :stories, :published_at, :datetime
  end

  def self.down
    remove_column :stories, :publish_at
    remove_column :stories, :published
    remove_column :stories, :published_at
  end
end