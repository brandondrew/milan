class Story < ActiveRecord::Base
  has_many :photo_placements
  has_many :photos, :through => :photo_placements
  
  
  require_dependency 'date_validator'

  # validates_dates :publish_at,
  #                 :from => '1 Jan 2000',
  #                 :to => '31 Dec 2020',
  #                 :allow_nil => true
                  # Date.today seems to restrictive: someone *might* need to mark something for the past,
                  # and it is certainly useful to post in the future, although I don't *yet* wait to publish it...
                  # but the idea of the field name not being past tense is that it is FORWARD-LOOKING
                  
                  

  def display_date
    if self.publish_at.nil?
      self.created_at
    else
      self.publish_at
    end
  end
  # NOTE: display_date is a DATE, the others are STRINGS
  def display_year
    display_date.year.to_s
  end
  def display_month
    Date::MONTHNAMES[display_date.month]
  end
  def display_day
    display_date.day.to_s
  end  
  def display_date_string 
    display_month + " " + display_day + " " + display_year
  end
    
end
