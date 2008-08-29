# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

# WHOOPS!  I named a field "extract" that should be "excerpt"... will change this soon... TODO

ActiveRecord::Schema.define(:version => 20080829052346) do

  create_table "photo_placements", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "story_id"
    t.integer  "display_height"
    t.integer  "display_width"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "photo_url"
    t.string   "photo_caption"
    t.integer  "photo_height"
    t.integer  "photo_width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.integer  "tab_position"
    t.boolean  "is_tab"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "section"
    t.string   "author"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "publish_at"
    t.boolean  "published"
    t.datetime "published_at"
    t.text     "extract"
    t.boolean  "is_breaking"
    t.integer  "section_id"
  end

end
