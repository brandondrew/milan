module StoriesHelper

  require 'BlueCloth'

  ### CAN'T GET MARUKU TO WORK... 
  # require 'maruku' 
  # def markdown(text)
  #     text.blank? ? "" : Maruku.new(text).to_html
  # end



  # TODO: GET_THIS_TO_WORK
  # def display_date
  #   if @story.publish_at.nil?
  #     @story.created_at
  #   else
  #     @story.publish_at
  #   end
  # end
  # 
  # def display_date_string
  #   Date::MONTHNAMES[display_date.month], " ", display_date.day, " ", display_date.year
  #   # display_date_string sounds redundant: you'd think display_date was already a string, since you're going to display it, no?
  #   # but of course the "display" part of display_date is because it's going to be used to display either the creation date or the publishing date.
  #   # maybe I should change display_date to something else, and then change display_date_string as well, to avoid confusion    
  # end
  # 
  # 
end
