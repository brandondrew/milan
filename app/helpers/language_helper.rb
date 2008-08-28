module LanguageHelper

  # not working, so for now I'm just using the UGLY code in the views...  TODO!
  class Date
    def self.month_abbrev
      Date::ABBR_MONTHNAMES[self.month]      
    end
    def self.month_name
      Date::MONTHNAMES[self.month]
    end
  end
  
end