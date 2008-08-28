class Photo < ActiveRecord::Base
  has_many :photo_placements
  has_many :stories, :through => :photo_placements
end
