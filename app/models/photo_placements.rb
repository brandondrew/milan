class PhotoPlacement < ActiveRecord::Base
  belongs_to :photo
  belongs_to :story
end